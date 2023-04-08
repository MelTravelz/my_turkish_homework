class UnsplashService
  def fetch_api
    response = connection.get
    JSON.parse(response.body, symbolize_names: true)
  end
  
  private
  def connection
    Faraday.new(url: "https://api.unsplash.com/photos/random") do |faraday|
      faraday.params["client_id"] =  ENV["client_id"]
      faraday.params["count"] =  1
    end
  end
end