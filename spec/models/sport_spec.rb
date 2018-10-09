require 'rails_helper'

RSpec.describe Sport, type: :model do
  let(:user) { User.create!(
    firstName:    Faker::Name.first_name, lastName:     Faker::Name.unique.last_name,
    email:        'rspecTest1@gmail.com', password:     'helloworld' ) }
  let(:athlete) { Athlete.create!(firstName: "Billy", middleName: "Bob", lastName: "Smith", user: user) }
  let(:sport) { Sport.create!(sportName: "Women's Swimming", athlete: athlete) }

  describe "attributes" do
    it "has sport attribute" do
      expect(sport).to have_attributes(sportName: "Women's Swimming")
    end
  end
end
