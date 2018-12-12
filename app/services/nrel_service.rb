class NrelService

  def get_stations(zip_code, radius = 6)
    get_json("/api/alt-fuel-stations/v1/nearest.json?location=#{zip_code}&fuel_type=ELEC,LPG&limit=10")
  end

  private

  def conn
    Faraday.new(url: "URL") do |faraday|
      faraday.params["api_key"] = ENV["NREL_API_KEY"]
      faraday.adapter Faraday.default_adapter
    end
  end
  
  def get_json(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end

end