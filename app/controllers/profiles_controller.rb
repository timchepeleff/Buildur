class ProfilesController < ApplicationController
  def show

  end

  def index
    @user = User.find(current_user)
    @repos = HTTParty.get(@user.repos_url)
    binding.pry
  end
end
