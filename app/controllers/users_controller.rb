class UsersController < ApplicationController
  def index
    if current_user.profile_edited?
      @projects = Project.all
      @user_search = User.search(params[:query], current_user)
    else
      redirect_to edit_user_path(current_user)
    end

      respond_to do |format|
        format.html
        format.js
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
    @user.user_skills.destroy_all if @user.user_skills
    @user.user_preferences.destroy_all if @user.user_preferences
    if params["user"]["skills"].count > 1
      params["user"]["skills"].each do |skill|
        unless skill == ""
          @user.user_skills.build(skill_id: skill)
        end
      end
    else
      @user.user_skills.build(skill_id: params["user"]["skills"])
    end

    if params["user"]["preferences"].count > 1
      params["user"]["preferences"].each do |preference|
        unless preference == ""
          @user.user_preferences.build(preference_id: preference)
        end
      end
    else
      @user.user_preferences.build(preference_id: params["user"]["preferences"])
    end
    if @user.save
      flash[:notice] = "Thanks for updating!"
      redirect_to user_path(current_user)
    else
      flash[:notice] = @user.errors.full_messages
      render :edit
    end
  end

  def show
    @users = User.all
    @user = User.find(params[:id])
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
end

