class FatherAddress < ApplicationRecord
  belongs_to :athlete, optional: true
end
