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

    context "#get_random_photo_and_verb" do
      before(:each) do
        @git = TurkishVerb.create!(turkish: "(e/a) gitmek", english: "to go")
        @gel = TurkishVerb.create!(turkish: "(i) istemek", english: "to want")
        @bil = TurkishVerb.create!(turkish: "(i) bilmek", english: "to know")
        @anla = TurkishVerb.create!(turkish: "(i) anlamak", english: "to understand")
        @kork = TurkishVerb.create!(turkish: "(den/dan) korkmak", english: "to be afraid")
      end

      it "returns a Prompt (poro) object" do
        image_response = File.read("spec/fixtures/unsplash/random_image.json")
        stub_request(:get, "https://api.unsplash.com/photos/random?client_id=#{ENV["unsplash_api_key"]}&count=1")
        .to_return(status: 200, body: image_response, headers: {})

        prompt_facade = PromptFacade.new

        expect(prompt_facade.get_random_photo_and_verb).to be_an(Prompt)

        expect(prompt_facade.get_random_photo_and_verb.id).to eq(nil)
        expect(prompt_facade.get_random_photo_and_verb.image_id).to be_a(String)
        expect(prompt_facade.get_random_photo_and_verb.image_urls).to be_a(Hash)
        expect(prompt_facade.get_random_photo_and_verb.image_urls.keys).to eq([:raw, :full, :regular, :small, :thumb, :small_s3])  
        expect(prompt_facade.get_random_photo_and_verb.turkish_verb).to be_a(String)
        expect(prompt_facade.get_random_photo_and_verb.english_verb).to be_a(String)
      end
    end
  end
end
