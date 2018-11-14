class Sport < ApplicationRecord
  belongs_to :athlete

  has_one :diving, dependent: :destroy, foreign_key: :sport_id
  has_one :swimming, dependent: :destroy, foreign_key: :sport_id
  has_one :waterpolo, dependent: :destroy, foreign_key: :sport_id

  has_and_belongs_to_many :programs

  accepts_nested_attributes_for :diving
  accepts_nested_attributes_for :swimming
  accepts_nested_attributes_for :waterpolo

  validates :sportName, presence: true

end
