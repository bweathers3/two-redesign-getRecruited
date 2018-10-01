require 'rails_helper'

RSpec.describe Athlete, type: :model do
  let(:athlete) { Athlete.create!(firstName: "Billy", middleName: "Bob", lastName: "Smith") }

  describe "attributes" do
    it "has firstName, middleName and lastName attributes" do
      expect(athlete).to have_attributes(firstName: "Billy", middleName: "Bob", lastName: "Smith")
    end
  end
end
