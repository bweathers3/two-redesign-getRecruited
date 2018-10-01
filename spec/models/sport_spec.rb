require 'rails_helper'

RSpec.describe Sport, type: :model do
  let(:athlete) { Athlete.create!(firstName: "Billy", middleName: "Bob", lastName: "Smith") }
  let(:sport) { Sport.create!(sport: "Women's Swimming", athlete: athlete) }

  describe "attributes" do
    it "has sport attribute" do
      expect(athlete).to have_attributes(sport: "Women's Swimming")
    end
  end
end
