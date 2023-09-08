require 'rails_helper'

RSpec.describe :movie, type: :model do
  describe "Validations" do
    subject { FactoryBot.create :movie }
    
    it "is valid with valid attributes" do
      is_expected.to be_valid
    end
    
    it "is not valid without a movie_url" do
	    subject.movie_url = nil
      is_expected.to_not be_valid
    end
  end
end
