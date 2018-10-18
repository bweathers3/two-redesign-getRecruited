class FatherContact < ApplicationRecord
  belongs_to :athlete, optional: true
end
