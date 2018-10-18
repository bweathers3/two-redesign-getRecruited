class Academic < ApplicationRecord
  belongs_to :athlete, optional: true
end
