class SearchController < ApplicationController
  def index
    binding.pry
    @station_search = StationSearchFacade.new(params[:q])
  end
end