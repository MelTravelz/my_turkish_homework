require 'rails_helper'

RSpec.describe "Users Pages Controller", type: :request do
  describe "#create" do # or is this new??
    context "when successful" do
      before(:each) do
        @picard = User.create!(user_name: "Jean-Luc-P", email: "captain@uss-enterprise.com", password: "IamCaptain!")

        @git = TurkishVerb.create!(turkish: "(e/a) gitmek", english: "to go")
        @gel = TurkishVerb.create!(turkish: "(i) istemek", english: "to want")
        @bil = TurkishVerb.create!(turkish: "(i) bilmek", english: "to know")
        @anla = TurkishVerb.create!(turkish: "(i) anlamak", english: "to understand")
        @kork = TurkishVerb.create!(turkish: "(den/dan) korkmak", english: "to be afraid")
      end

      it "creates a new page form page" do
        image_response = File.read("spec/fixtures/unsplash/random_image.json")
        stub_request(:get, "https://api.unsplash.com/photos/random?client_id=#{ENV["unsplash_api_key"]}&count=1")
        .to_return(status: 200, body: image_response, headers: {})

        get "/api/v1/users/#{@picard.id}/pages/new"

        expect(response).to be_successful

        parsed_data = JSON.parse(response.body, symbolize_names: true)

        expect(parsed_data[:data]).to be_a(Hash)
        expect(parsed_data[:data].keys).to eq([:id, :type, :attributes])
        expect(parsed_data[:data][:attributes].keys).to eq([:image_id, :image_urls, :turkish_verb, :english_verb])
        expect(parsed_data[:data][:attributes][:image_urls].keys).to eq([:raw, :full, :regular, :small, :thumb, :small_s3])
      end
    end
  end
end