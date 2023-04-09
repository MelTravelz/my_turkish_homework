require 'rails_helper'

RSpec.describe UnsplashService do
  describe "instance methods" do
    context "#fetch_api" do
      it "returns json objects" do
        image_response = File.read("spec/fixtures/unsplash/random_image.json")
        stub_request(:get, "https://api.unsplash.com/photos/random?client_id=#{ENV["unsplash_api_key"]}&count=1")
        .to_return(status: 200, body: image_response, headers: {})

        response = UnsplashService.new.fetch_api
        
        expect(response).to be_an(Array)
        expect(response).to_not be_empty
        expect(response.first.keys.count).to eq(22)
      end
    end
  end
end