class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :user, only: [:show, :edit, :update, :destroy]

  def index
    @photos = Photo.where(owner_id: current_user.id)
    username = current_user.username
    render "users/index"
  end

  def show
    @user = User.find_by!(username: params.fetch(:username))
  end

  def liked
    @user = User.find_by!(username: params.fetch(:username))
    
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: 'User was successfully created.'}
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render "users/new", status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
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
    redirect_to destroy_user_session_path
  end

  def discover
  end

  def feed
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to "/", notice: 'User was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
  
  def user
    @user = User.where(:username => params[:username]).first
  end
end
