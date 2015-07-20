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
  end

  def update
    @user = current_user
    @user.update(user_params)
    @user.user_skills.destroy_all
    if params["user"]["skills"].count > 1
      params["user"]["skills"].each do |skill|
        unless skill == ""
          @user.user_skills.build(skill_id: skill)
        end
      end
    else
      @user.user_skills = Skill.find(params["user"]["skill"])
    end
    @user.preference = Preference.find(params["user"]["preference"])
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

