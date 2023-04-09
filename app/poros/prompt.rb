class Prompt 
  attr_reader :id, :image_urls, :image_id

  def initialize(info)
    @id = nil
    @image_urls = info[:image_details].first[:urls]
    @image_id = info[:image_details].first[:id]
  end
end