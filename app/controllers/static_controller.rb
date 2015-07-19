class StaticController < ApplicationController
  def index
    unless current_user.profile_edited?
      redirect_to edit_user_path(current_user)
    end
  end
end
