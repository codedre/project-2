class FoodsController < ApplicationController

  def new
    @food = Food.new
  end

  def create
    @mood = Mood.find(params[:mood_id])
    @food = @mood.foods.create!(food_params.merge(mood: @mood))
    redirect_to moods_path
  end

  private

  def food_params
    params.require(:food).permit(:name, :mood_id)
  end
end
