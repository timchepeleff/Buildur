class ProfilesController < ApplicationController
  def show
    @users = User.all
    @user = User.find(params[:id])
    @profile = @user.profile
    @repos = HTTParty.get(@user.repos_url + "?client_id=#{ENV["GITHUB_CLIENT_ID"]}&client_secret=#{ENV["GITHUB_CLIENT_SECRET"]}&per_page=100")
    @top_languages = language_frequency(@repos)
  end

  def new
    @user = current_user
    @profile = Profile.new
  end

  def create
    @user = current_user
    @profile = @user.build_profile(profile_params)
    if @profile.save
      flash[:notice] = "Thank you! Your profile has been saved"
      binding.pry
      redirect_to profile_path(current_user)
    else
      flash[:notice] = @profile.errors.full_messages
      render new_profile_path(current_user)
    end
  end

  def index
    if current_user.profile
      @profile = current_user.profile
      @user_count = User.all.count
      @random_user = User.find(rand(@user_count)+1)
    else
      redirect_to new_profile_path(current_user)
    end
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
    params.require(:profile).permit(:example_url1,
      :example_url2,
      :techinterests,
      :location,
      :skill,
      :email,
      :website,
      :job,
      :about)
  end

end

