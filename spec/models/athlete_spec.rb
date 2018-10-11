require 'rails_helper'
require 'shoulda/matchers'

RSpec.describe Athlete, type: :model do
  let(:user2) { User.create!(
    firstName:    Faker::Name.first_name, lastName:     Faker::Name.unique.last_name,
    email:        'rspecTest1@gmail.com', password:     'helloworld' ) }
  let(:firstname) { Faker::Name.first_name }
  let(:middlename) { Faker::Name.first_name }
  let(:preferredname) { Faker::Name.first_name }
  let(:lastname) { Faker::Name.unique.last_name }
  let(:athlete) { Athlete.create!(firstName: firstname, middleName: middlename, lastName: lastname,
    preferredName: preferredname, yearStartingSchool: "Sept. 2018 - May 2019", user: user2) }
  let(:activeValue) { true }

  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:sports) }

  describe "attributes" do
    it "has firstName, middleName and lastName attributes" do
      expect(athlete).to have_attributes(firstName: firstname, middleName: middlename, lastName: lastname,
      preferredName: preferredname, yearStartingSchool: "Sept. 2018 - May 2019", active: activeValue)
    end

    it "is active by default" do
       expect(athlete.active).to be(true)
    end
  end
end
