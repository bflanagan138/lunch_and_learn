class VideosService
  def self.conn
    Faraday.new(url: "https://youtube.googleapis.com", params: { part: 'snippet', key: ENV['google_api_key'], channelId: ENV['youtube_channel_id'] })
  end

  def self.videos(country)
    response = conn.get("/youtube/v3/search?q=#{country}")
    videos = parse(response)
    
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end