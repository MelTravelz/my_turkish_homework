require 'rails_helper'

RSpec.describe TurkishVerb, type: :model do
  describe "validations" do
    it { should validate_presence_of :turkish }
    it { should validate_presence_of :english }
  end
end