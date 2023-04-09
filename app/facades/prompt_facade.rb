require 'ostruct'

class PromptFacade
  attr_reader :unsplash_service

  def initialize 
    @unsplash_service = UnsplashService.new
  end

  def get_random_photo_and_word
    info_hash = {
      image_details: unsplash_service.fetch_api
      # word_details: turkishAPI_service.fetch_api
    }
    # image_details = unsplash_service.fetch_api
    # word_details = turkishAPI_service.fetch_api

    Prompt.new(info_hash)
  end
end