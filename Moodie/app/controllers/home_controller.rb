class HomeController < ApplicationController

  def search
    parameters = { term: params[:query], limit: 16 }
    @search = YelpSearch.new("washington,dc", parameters)
    @resturants = @search.businesses
  end
end
