require 'rails_helper'

RSpec.describe "Users Homeworks Controller", type: :request do
  describe "#create" do # or is this new??
    context "when successful" do
      it "creates a new homework form page" do
        image_response = File.read("spec/fixtures/unsplash/random_image.json")
        stub_request(:get, "https://api.unsplash.com/photos/random?client_id=#{ENV["unsplash_api_key"]}&count=1")
        .to_return(status: 200, body: image_response, headers: {})

        get "/api/v1/users/:id/pages"

        expect(response).to be_successful
        parsed_data = JSON.parse(response.body, symbolize_names: true)

        

      end
    end
    # this will test the homework new form action
    # a users/homework show & index actions too
  end
end