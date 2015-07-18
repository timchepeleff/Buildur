class RejectsController < ApplicationController
  def create
    @reject = Reject.create(reject_id: params[:reject_id],
                            user_id: current_user.id)
    if @reject.save
      flash[:notice] = "Rejected User."
      redirect_to params[:user_id]
    else
      flash[:notice] = "Unable to reject user."
      redirect_to params[:user_id]
    end
  end

  def destroy
    @reject = current_user.friendships.find(params[:id])
    @reject.destroy
    flash[:notice] = "Unblocked User."
    redirect_to user_path(current_user)
  end
end
