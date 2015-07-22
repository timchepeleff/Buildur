class User < ActiveRecord::Base
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  has_many :inverse_friendships, class_name: "Friendship", foreign_key: "friend_id"
  has_many :inverse_friends, through: :inverse_friendships, source: :user
  has_many :projects, through: :project_users
  has_many :project_users
  has_many :skills, through: :user_skills
  has_many :user_skills, dependent: :destroy
  has_many :preferences, through: :user_preferences
  has_many :user_preferences, dependent: :destroy
  has_many :rejects, dependent: :destroy
  has_many :conversations, :foreign_key => :sender_id

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable,
    :omniauthable, :omniauth_providers => [:github]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.avatar_url = auth.info.image
      user.username = auth.info.nickname
      user.name = auth.info.name
      user.repos_url = auth.extra.raw_info.repos_url
      user.password = Devise.friendly_token[0,20]
      user.token = auth.credentials.token
    end
  end

  def self.search(search, current_user)
    if search
      return where(["name @@ ?", search.downcase]).order(name: :asc)
    else
      matched = []
      current_user.user_preferences.each do |preference|
        matches = UserSkill.where("skill_id = ? and user_id != ?", preference.preference_id, current_user.id)
        matches.each do |match|
          matched << match.user unless match.user.nil?
        end
      end
      rejects = []
      if current_user.rejects
        current_user.rejects.each do |reject|
          reject_id = reject.reject_id
          u = User.find(reject_id)
          rejects << u
        end
      else
        return matched
      end
      matches = matched.flatten.uniq - rejects
      return matches
    end
  end

  def admin?
    role == "admin"
  end

  def owner?(object)
    id == object.user_id
  end

  def admin_or_owner?(object)
    admin? || owner?(object)
  end

  def mutual_friends
    friends = []
    friendships.each do |user|
      friends << user.friend if inverse_friends.include?(user.friend)
    end
    friends
  end

  def profile_edited?
    if email == "" || email.nil?
      return false
    elsif example_url1.nil? || example_url1_img.nil? || example_url2.nil? || example_url2_img.nil? || techinterests.nil? || location.nil?
      return false
    end
    true
  end

  def top_languages
    repos = HTTParty.get(repos_url + "?client_id=#{ENV["GITHUB_CLIENT_ID"]}&client_secret=#{ENV["GITHUB_CLIENT_SECRET"]}&per_page=200")
    language_frequency(repos)
  end


  def language_frequency(repos)
    frequencies = Hash.new(0)
    repos.each do |hash|
      if hash["language"]
        frequencies[hash["language"]] += 1
      end
    end
    frequencies
  end

  def user_model
  end
end
