class CurrentAddress < ApplicationRecord
  belongs_to :athlete, optional: true
end
