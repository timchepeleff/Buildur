class FriendshipsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @users = User.all
    @friendship = Friendship.new
  end

  def create
    @friendship = Friendship.find_or_create_by(friend_id: params[:friend_id], user_id: current_user.id )
    if @friendship.save!
      flash[:notice] = "Added friend."
      redirect_to user_path(params[:user_id])
    else
      flash[:notice] = "Unable to add friend."
      render user_path(current_user)
    end
  end

  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    flash[:notice] = "Removed friendship."
    redirect_to user_path(current_user)
  end
end
