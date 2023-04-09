class Api::V1::Users::PagesController < ApplicationController
  def new
    word_and_image_prompt = PromptFacade.new.get_random_photo_and_word
    render json: PromptSerializer.new(word_and_image_prompt)
  end
end