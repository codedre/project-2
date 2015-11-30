class FoodsController < ApplicationController

  def index
    @mood = Mood.find(params[:mood_id])
    @food = @mood.foods
    respond_to do |format|
      format.html
      format.json { render json: @food }
    end
  end
  def new
    @food = Food.new
    @mood = Mood.find(params[:mood_id])
    @user = current_user
  end

  def create
    @mood = Mood.find(params[:mood_id])
    @food = @mood.foods.create!(food_params)
    redirect_to moods_path
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    redirect_to moods_path
  end

  private

  def food_params
    params.require(:food).permit(:name, :mood_id)
  end
end
