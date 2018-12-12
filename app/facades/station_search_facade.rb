class StationSearchFacade

  def initialize(zip_code)
    @zip_code = zip_code
  end

  def stations
    binding.pry
    station_data[:fuel_stations].map do |station|
      Station.new(station)
    end
  end

  # :station_name=>"UDR",
  # :street_address=>"800 Acoma St",
  # :fuel_type_code=>"ELEC",
  # :distance=>0.31422,
  # :access_days_time=>"24 hours daily"

  private

  def nrel_service
    @nrel_service ||= NrelService.new
  end

  def station_data
    nrel_service.get_stations(@zip_code)
  end
end