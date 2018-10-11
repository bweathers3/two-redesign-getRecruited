class Sport < ApplicationRecord
  belongs_to :athlete

  validates :sportName, presence: true
end
