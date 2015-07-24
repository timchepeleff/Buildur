class UsersController < ApplicationController
  def index
    if current_user.profile_edited?
      @projects = Project.all
      @user_search = User.search(params[:query], current_user)

       respond_to do |format|
        format.html
        format.js
      end
    else
      flash[:notice] = "In order to find matches both Skills and Preferences must be filled out!"
      redirect_to edit_user_path(current_user)
    end
  end

  def edit
    @user = current_user
    @current_preferences = current_user.user_preferences
    @current_skills = current_user.user_skills
  end

  def update
    @user = current_user
    @user.update(user_params)
    update_preferences
    update_skills
    if @user.save
      flash[:notice] = "Thanks for updating!"
      redirect_to user_path(current_user)
    else
      flash[:notice] = @user.errors.full_messages
      render :edit
    end
  end

  def show
    if current_user.profile_edited?
      @users = User.all
      @user = User.find(params[:id])
    else
      flash[:notice] = "In order to find matches both Skills and Preferences must be filled out!"
      redirect_to edit_user_path(current_user)
    end
  end

  private

  def user_params
    params.require(:user).permit(:example_url1,
      :example_url1_img,
      :example_url2,
      :example_url2_img,
      :techinterests,
      :location,
      :email,
      :website,
      :job,
      :about)
  end

  def update_preferences
    @user.user_preferences.destroy_all if @user.user_preferences
    if params["user"]["preferences"].count > 1
      params["user"]["preferences"].each do |preference|
        unless preference == ""
          @user.user_preferences.build(preference_id: preference)
        end
      end
    else
      @user.user_preferences.build(preference_id: params["user"]["preferences"])
    end
  end

  def update_skills
    @user.user_skills.destroy_all if @user.user_skills
    if params["user"]["skills"].count > 1
      params["user"]["skills"].each do |skill|
        unless skill == ""
          @user.user_skills.build(skill_id: skill)
        end
      end
    else
      @user.user_skills.build(skill_id: params["user"]["skills"])
    end
  end
end

