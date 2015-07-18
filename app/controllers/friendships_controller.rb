class FriendshipsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @users = User.all
    @friendship = Friendship.new
  end

  def create
    binding.pry
    @friendship = Friendship.create(friend_id: params[:friend_id], user_id: current_user.id)
    if @friendship.save!
      flash[:notice] = "Added friend."
      redirect_to params[:user_id]
    else
      flash[:notice] = "Unable to add friend."
      render user_path(current_user)
    end

    respond_to do |format|
      format.js
    end
  end

  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    flash[:notice] = "Removed friendship."
    redirect_to user_path(current_user)
  end
end
