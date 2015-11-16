class HomeController < ApplicationController

  def search
    # parameters = { term: params[:term], limit: 16 }
    @search = YelpSearch.new("washington,dc", {term: "pizza"})
    @resturants = @search.businesses
    # render json: Yelp.client.search('pizza')
  end
end
