require 'rails_helper'

RSpec.describe PromptFacade do
  describe "instance methods" do

    context "#initialize" do
      it "exists & creates an instance of all services" do
        prompt_facade = PromptFacade.new

        expect(prompt_facade).to be_a(PromptFacade)
        expect(prompt_facade.unsplash_service).to be_a(UnsplashService)
      end
    end

    context "#get_random_photo_and_word" do
      it "returns a OpenStruct object" do
        image_response = File.read("spec/fixtures/unsplash/random_image.json")
        stub_request(:get, "https://api.unsplash.com/photos/random?client_id=#{ENV["unsplash_api_key"]}&count=1")
        .to_return(status: 200, body: image_response, headers: {})

        prompt_facade = PromptFacade.new

        expect(prompt_facade.get_random_photo_and_word).to be_an(OpenStruct)
        expect(prompt_facade.get_random_photo_and_word.image).to be_a(Hash)
        expect(prompt_facade.get_random_photo_and_word.image.keys).to eq([:raw, :full, :regular, :small, :thumb, :small_s3])
      end
    end
  end
end
