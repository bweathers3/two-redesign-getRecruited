require 'rails_helper'
require 'shoulda/matchers'

RSpec.describe User, type: :model do
  it { is_expected.to have_many(:athletes) }
end
