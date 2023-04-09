require 'rails_helper'

RSpec.describe User, type: :model do
  describe "relationships" do
    it { should have_many(:pages) }
  end

  describe "validations" do
    it { should validate_presence_of(:user_name) }
    it { should validate_uniqueness_of(:user_name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:password) }
    it { should have_secure_password }
  end

  it "exsists & had attributes" do
    picard = User.create!(user_name: "Jean-Luc-P", email: "captain@uss-enterprise.com", password: "IamCaptain!")
    # riker = User.create!(user_name: "W-Riker", email: "number2@uss-enterprise.com", password_digest: "IamNumber2")
    # data = User.create!(user_name: "Data", email: "data@uss-enterprise.com", password_digest: "IamData?")

    expect(picard).to be_a(User)
    expect(picard.user_name).to eq("Jean-Luc-P")
    expect(picard.email).to eq("captain@uss-enterprise.com")
    expect(picard.password).to eq("IamCaptain!")
  end
end