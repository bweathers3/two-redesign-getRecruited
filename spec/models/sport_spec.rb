require 'rails_helper'

RSpec.describe Sport, type: :model do
  let(:user) { User.create!(
    firstName:    Faker::Name.first_name, lastName:     Faker::Name.unique.last_name,
    email:        'rspecTest1@gmail.com', password:     'helloworld' ) }
  let(:firstname) { Faker::Name.first_name }
  let(:middlename) { Faker::Name.first_name }
  let(:preferredname) { Faker::Name.first_name }
  let(:lastname) { Faker::Name.unique.last_name }
  let(:athlete) { Athlete.create!(firstName: firstname, middleName: middlename, lastName: lastname,
      preferredName: preferredname, yearStartingSchool: "Sept. 2018 - May 2019", user: user) }

  let(:sport) { athlete.sports.create!(sportName: "Women's Swimming") }
  let(:activeValue) { true }

  it { is_expected.to belong_to(:athlete) }

  describe "attributes" do
    it "has sport attribute" do
      expect(sport).to have_attributes(sportName: "Women's Swimming", active: activeValue)
    end

    it "is active by default" do
       expect(sport.active).to be(true)
    end
  end
end
