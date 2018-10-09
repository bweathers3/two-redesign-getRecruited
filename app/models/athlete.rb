class Athlete < ApplicationRecord
  belongs_to :user
  has_many :sports, dependent: :destroy

  validates :firstName, length: { minimum: 1 }, presence: true
  validates :lastName, length: { minimum: 1 }, presence: true
  validates :user, presence: true
end
