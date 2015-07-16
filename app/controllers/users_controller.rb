class UsersController < ApplicationController
  def index
    if current_user.profile_edited?
      @user_count = User.all.count
      @random_user = User.find(rand(@user_count)+1)
      @projects = Project.all
      @user_search = User.search(params[:query])
                           .order(name: :asc)
                           .page(params[:page])
                           .per(1)
    else
      redirect_to edit_user_path(current_user)
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)

    if @user.save
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def show
    @users = User.all
    @user = User.find(params[:id])
  end

  def destroy
    @workspace = Workspace.find(params[:id])
    if @workspace.destroy
      flash[:notice] = "Who wants to do work, anyway? Workspace deleted."
    else
      flash[:notice] = "I'm sorry Dave, I can't do that."
    end
    redirect_to workspaces_path
  end

  private

  def user_params
    params.require(:user).permit(:example_url1,
      :example_url1_img,
      :example_url2,
      :example_url2_img,
      :techinterests,
      :location,
      :skill,
      :email,
      :website,
      :job,
      :about)
  end
end

