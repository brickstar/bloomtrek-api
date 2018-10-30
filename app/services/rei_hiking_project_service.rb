class ReiHikingProjectService
  def initialize
    @conn = Faraday.new(url: "https://www.hikingproject.com")
  end

  def trails(latitude, longitude)
    get_url("/data/get-trails?lat=#{latitude}&lon=#{longitude}&maxDistance=10&key=#{ENV["HIKING_PROJECT_KEY"]}")
  end

  def get_trails_by_id(trail_ids)
    get_url("/data/get-trails-by-id?ids=#{trail_ids}&key=#{ENV["HIKING_PROJECT_KEY"]}")
  end

  private

  def get_url(url)
    response = @conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
