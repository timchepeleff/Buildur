class ProfilesController < ApplicationController
  def show
    @users = User.all
    @user = User.find(params[:id])
    @repos = HTTParty.get(@user.repos_url + "?client_id=#{ENV["GITHUB_CLIENT_ID"]}&client_secret=#{ENV["GITHUB_CLIENT_SECRET"]}&per_page=100")
    @top_languages = language_frequency(@repos)
  end

  def new
    @user = current_user
    @profile = Profile.new
  end

  def create

  end

  def index
    @user_count = User.all.count
    @random_user = User.find(rand(@user_count)+1)

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

  private

  def profile_params

  end

end

