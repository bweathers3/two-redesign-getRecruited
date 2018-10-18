class Contact < ApplicationRecord
  belongs_to :athlete, optional: true
end
