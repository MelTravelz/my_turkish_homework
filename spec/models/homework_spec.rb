require 'rails_helper'

RSpec.describe Homework, type: :model do
  describe "relationships" do
    it { should belong_to :user }
  end

  describe "validations" do
    it { should validate_presence_of :user_id }
    it { should validate_presence_of :language }
    it { should validate_presence_of :theme_image }
    it { should validate_presence_of :word_prompt }
  end

end