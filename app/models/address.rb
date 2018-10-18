class Address < ApplicationRecord
  belongs_to :athlete, optional: true
end
