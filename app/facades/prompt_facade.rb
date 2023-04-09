require 'ostruct'

class PromptFacade
  attr_reader :unsplash_service

  def initialize 
    @unsplash_service = UnsplashService.new
  end

  def get_random_photo_and_verb
    turkish_verbs = TurkishVerb.all
    verb_info = turkish_verbs.sample(1).pop
    
    info_hash = {
      image_details: unsplash_service.fetch_api,
      verb_details: verb_info
    }

    Prompt.new(info_hash)
  end
end