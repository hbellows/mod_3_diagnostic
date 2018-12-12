class Station

  attr_reader :name,
              :address,
              :fuel_types,
              :distance,
              :access_times

  def initialize(station_data)
    @name = station_data[:station_name]
    @address = station_data[:street_address]
    @fuel_types = station_data[:fuel_type_code]
    @distance = station_data[:distance]
    @access_times = station_data[:access_days_time]
  end
end

  # :station_name=>"UDR",
  # :street_address=>"800 Acoma St",
  # :fuel_type_code=>"ELEC",
  # :distance=>0.31422,
  # :access_days_time=>"24 hours daily"
