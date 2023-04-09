class Prompt 
  attr_reader :id, 
              :image_urls, 
              :image_id, 
              :turkish_verb,
              :english_verb

  def initialize(info)
    @id = nil
    @image_urls = info[:image_details].first[:urls]
    @image_id = info[:image_details].first[:id]
    @turkish_verb = info[:verb_details].turkish
    @english_verb = info[:verb_details].english
  end
end