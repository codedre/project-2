class HomeController < ApplicationController

  def index
    @user = current_user
  end
  def search
    parameters = { term: params[:query], limit: 16 }
    @search = YelpSearch.new("washington,dc", parameters)
    @restaurants = @search.businesses
  end
end
