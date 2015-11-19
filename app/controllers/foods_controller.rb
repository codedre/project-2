class FoodsController < ApplicationController

  def new
    @food = Food.new
    @mood = Mood.find(params[:mood_id])
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
