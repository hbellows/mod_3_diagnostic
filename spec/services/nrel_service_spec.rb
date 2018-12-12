require 'rails_helper'

describe NrelService do
  it 'can retrieve station data' do
    VCR.use_cassette("NREL Service Test") do
      service = NrelService.new
      station_data = service.get_stations('80203')

      expect(station_data).to be_a(Hash)
      expect(station_data[:fuel_stations]).to be_a(Array)
      expect(station_data[:fuel_stations][0]).to have_key(:station_name)
      expect(station_data[:fuel_stations][0]).to have_key(:street_address)
      expect(station_data[:fuel_stations][0]).to have_key(:fuel_type_code)
      expect(station_data[:fuel_stations][0]).to have_key(:distance)
      expect(station_data[:fuel_stations][0]).to have_key(:access_days_time)
      expect(station_data[:fuel_stations][0][:station_name]).to be_a(String)
      expect(station_data[:fuel_stations][0][:street_address]).to be_a(String)
      expect(station_data[:fuel_stations][0][:fuel_type_code]).to be_a(String)
      expect(station_data[:fuel_stations][0][:distance]).to be_a(Float)
      expect(station_data[:fuel_stations][0][:access_days_time]).to be_a(String)
    end
  end
end