class Profile < ActiveRecord::Base
  def admin?
    role == "admin"
  end

  def owner?(object)
    id == object.user_id
  end

  def admin_or_owner?(object)
    admin? || owner?(object)
  end

  belongs_to :user
end
