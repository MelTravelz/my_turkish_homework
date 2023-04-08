require 'rails_helper'

RSpec.describe UnsplashService do
  describe "instance methods" do
    context "#fetch_api" do
      it "returns json objects" do
        response = UnsplashService.new.fetch_api
        
        expect(response).to be_an(Array)
        expect(response).to_not be_empty
        expect(response.first.keys.count).to eq(22)
      end
    end
  end
end