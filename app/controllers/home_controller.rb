class HomeController < ApplicationController
  helper_method :resource_name, :resource, :devise_mapping

  def index
    @user = current_user
  end

  def search
    parameters = { term: params[:query], limit: 16 }
    @search = YelpSearch.new("washington,dc", parameters)
    @restaurants = @search.businesses
  end


  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
