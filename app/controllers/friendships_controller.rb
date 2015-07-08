class FriendshipsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @users = User.all
    @friendship = Friendship.new
  end

  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    if @friendship.save
      flash[:notice] = "Added friend."
      redirect_to user_friendships_path
    else
      flash[:notice] = "Unable to add friend."
      redirect_to user_friendships_path
    end
  end

  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    flash[:notice] = "Removed friendship."
    redirect_to user_friendships_path
  end
end
