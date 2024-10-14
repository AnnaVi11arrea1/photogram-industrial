class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :user, only: [:show, :edit, :update, :destroy]

  def user
    user = User.where(id: current_user.id).first
  end

  def index
    id = params[:id]
    @photos = Photo.where(owner_id: current_user.id)
    render "users/index"
  end

  def create
  end

  def update
  end

  def edit
    render "users/edit"
  end

  def sign_out
    redirect_to root_path, notice: 'Signed out successfully.'
  end

  def goodbye_session
    destroy_user_session_path
  end

  def discover
  end

  def feed
  end

  def delete
  end

  private



end
