require 'rails_helper'

describe Station do
  it 'can be created from attributes' do
    attributes = {
                  station_name: 'Awesome Station Name', 
                  street_address: '123 Anytown, Anywhere, 80203',
                  fuel_type_code: 'ELEC, LPG',
                  distance: 12.34,
                  access_days_time: "Fifty percent of the time, it\'s open all the time" 
                 }
                 
    station = Station.new(attributes)

    expect(station.name).to eq('Awesome Station Name')
    expect(station.address).to eq('123 Anytown, Anywhere, 80203')
    expect(station.fuel_types).to eq('ELEC, LPG')
    expect(station.distance).to eq(12.34)
    expect(station.access_times).to eq("Fifty percent of the time, it\'s open all the time")
  end
end