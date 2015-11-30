class MoodsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy, :index]
  # index
  def index
    @moods = current_user.moods.order("created_at DESC")
    @user = current_user
  end

  # new
  def new
    @mood = current_user.moods.new
    @user = current_user
  end

  # create
  def create
    @mood = current_user.moods.create!(mood_params)
    redirect_to moods_path
  end

  #show
  def show
    @mood = Mood.find(params[:id])
  end

  # edit
  def edit
    @mood = current_user.moods.find(params[:id])
    @user = current_user
  end

  #update
  def update
    @mood = current_user.moods.find(params[:id])
    @mood.update(mood_params)
    redirect_to moods_path
  end

  #delete
  def destroy
    @mood = current_user.moods.find(params[:id])
    @mood.destroy
    redirect_to moods_path
  end


  private
  def mood_params
    params.require(:mood).permit(:name)
  end

end
