class SchoolAddress < ApplicationRecord
  belongs_to :athlete, optional: true
end
