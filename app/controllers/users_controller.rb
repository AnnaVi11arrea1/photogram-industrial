class UsersController < ApplicationController
  def user
    @user = User.where(id: current_user.id).first
  end

  def sign_out
    session.destroy
    redirect_to root_path, notice: "Signed out successfully."
  end


  def discover

  end

  def feed
  end

  def edit
  end

  def delete
  end



end
