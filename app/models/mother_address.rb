class MotherAddress < ApplicationRecord
  belongs_to :athlete, optional: true
end
