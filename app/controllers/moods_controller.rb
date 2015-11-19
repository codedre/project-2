class MoodsController < ApplicationController

  # index
  def index
    @moods = Mood.all
  end

  # new
  def new
    @mood = Mood.new
  end

  # create
  def create
    @mood = Mood.create!(mood_params)
    redirect_to moods_path
  end

  #show
  def show
    @mood = Mood.find(params[:id])
  end

  # edit
  def edit
    @mood = Mood.find(params[:id])
  end

  #update
  def update
    @mood = Mood.find(params[:id])
    @mood.update(mood_params)
    redirect_to moods_path
  end

  #delete
  def destroy
    @mood = Mood.find(params[:id])
    @mood.destroy
    redirect_to moods_path
  end


  private
  def mood_params
    params.require(:mood).permit(:name)
  end

end
