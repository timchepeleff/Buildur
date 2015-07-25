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
    update_field(params["user"]["preferences"], @user.user_preferences, :preference_id)
    update_field(params["user"]["skills"], @user.user_skills, :skill_id)
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

  def update_field(param, field, id)
    field.destroy_all if field
    if multi_inputs?(param)
      multi_insert!(param, field, id)
    else
      field.build(id => param)
    end
  end

  def multi_inputs?(param)
    param.count > 1
  end

  def multi_insert!(param, field, id)
    param.each do |f|
        unless f == ""
          field.build(id => f)
        end
      end
  end

end

