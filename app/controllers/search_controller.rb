class SearchController < ApplicationController
  def index
    @station_search = StationSearchFacade.new(params[:q])
  end
end