require 'ostruct'

class PromptFacade
  attr_reader :unsplash_service

  def initialize 
    @unsplash_service = UnsplashService.new
  end

  def get_random_photo_and_word
    image_details = unsplash_service.fetch_api
    OpenStruct.new(image: image_details.first[:urls])
  end
end