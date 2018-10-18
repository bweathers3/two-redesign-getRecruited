class MotherContact < ApplicationRecord
  belongs_to :athlete, optional: true
end
