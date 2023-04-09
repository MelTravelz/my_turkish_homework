require 'rails_helper'

RSpec.describe Page, type: :model do
  describe "relationships" do
    it { should belong_to :user }
  end

  describe "validations" do
    it { should validate_presence_of :user_id }
    it { should validate_presence_of :language }
    it { should validate_presence_of :theme_image }
    it { should validate_presence_of :word_prompt }
  end

  it "exsists & had attributes" do
    picard = User.create!(user_name: "Jean-Luc-P", email: "captain@uss-enterprise.com", password: "IamCaptain!")
    page1 = picard.pages.create!(language: "Turkish", theme_image: "https://images.unsplash.com/photo-1", word_prompt: "gitmek", sent1: "Haziran Türkiye'ye gidiyorum.")
  
    expect(page1).to be_a(Page)
    expect(page1.language).to eq("Turkish")
    expect(page1.theme_image).to eq("https://images.unsplash.com/photo-1")
    expect(page1.word_prompt).to eq("gitmek")
    expect(page1.sent1).to eq("Haziran Türkiye'ye gidiyorum.")
  end
end