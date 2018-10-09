require 'rails_helper'
require 'shoulda/matchers'

RSpec.describe Athlete, type: :model do
  let(:user2) { User.create!(
    firstName:    Faker::Name.first_name, lastName:     Faker::Name.unique.last_name,
    email:        'rspecTest1@gmail.com', password:     'helloworld' ) }
  let(:athlete) { Athlete.create!(firstName: "Billy", middleName: "Bob", lastName: "Smith", user: user2) }

  it { is_expected.to belong_to(:user) }

  describe "attributes" do
    it "has firstName, middleName and lastName attributes" do
      expect(athlete).to have_attributes(firstName: "Billy", middleName: "Bob", lastName: "Smith")
    end
  end
end
