class Api::V1::Users::PagesController < ApplicationController
  def new
    verb_and_image_prompt = PromptFacade.new.get_random_photo_and_verb
    render json: PromptSerializer.new(verb_and_image_prompt)
  end
end