require 'rails_helper'

RSpec.describe "Users Pages Controller", type: :request do
  describe "#create" do # or is this new??
    context "when successful" do
      it "creates a new page form page" do
        picard = User.create!(user_name: "Jean-Luc-P", email: "captain@uss-enterprise.com", password: "IamCaptain!")

        image_response = File.read("spec/fixtures/unsplash/random_image.json")
        stub_request(:get, "https://api.unsplash.com/photos/random?client_id=#{ENV["unsplash_api_key"]}&count=1")
        .to_return(status: 200, body: image_response, headers: {})

        get "/api/v1/users/#{picard.id}/pages/new"

        expect(response).to be_successful

        parsed_data = JSON.parse(response.body, symbolize_names: true)

        expect(parsed_data[:data]).to be_a(Hash)
        expect(parsed_data[:data].keys).to eq([:id, :type, :attributes])
        expect(parsed_data[:data][:attributes].keys).to eq([:image_urls, :image_id])
      end
    end
  end
end