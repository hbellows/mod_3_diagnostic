class StationSearchFacade

  def initialize(zip_code)
    @zip_code = zip_code
  end

  def station_count
    station_data[:fuel_stations].count
  end

  def stations
    station_data[:fuel_stations].map do |station|
      Station.new(station)
    end
  end

  private
  def nrel_service
    @nrel_service ||= NrelService.new
  end

  def station_data
    nrel_service.get_stations(@zip_code)
  end
end