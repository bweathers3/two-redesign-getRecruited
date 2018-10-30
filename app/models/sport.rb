class Sport < ApplicationRecord
  belongs_to :athlete

  has_one :swimming, foreign_key: :sport_id

  accepts_nested_attributes_for :swimming

  validates :sportName, presence: true
end
