class FollowersController < ApplicationController
  before_action :set_follower, only: %i[ show edit update destroy ]

  def index
    @followers = Follower.all
  end

  def show
  end

  def new
    @follower = Follower.new
  end

  def edit
  end

  def create
    @follower = Follower.new(follower_params)

    respond_to do |format|
      if @follower.save
        format.html { redirect_to follower_url(@follower), notice: "Follower was successfully created." }
        format.json { render :show, status: :created, location: @follower }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @follower.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @follower.update(follower_params)
        format.html { redirect_to follower_url(@follower), notice: "Follower was successfully updated." }
        format.json { render :show, status: :ok, location: @follower }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @follower.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @follower.destroy!

    respond_to do |format|
      format.html { redirect_to followers_url, notice: "Follower was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_follower
      @follower = Follower.find(params[:id])
    end

    def follower_params
      params.require(:follower).permit(:sender_id, :recepient_id, :status)
    end
end
