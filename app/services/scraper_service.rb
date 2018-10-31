class ScraperService
  def initialize
    @conn = Faraday.new(url: "https://bloomtrek-api-scraper.herokuapp.com")
  end

  def flowers(website)
    get_url("/api/v1/scraper?website=#{website}")
  end

  private

  def get_url(url)
    response = @conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
