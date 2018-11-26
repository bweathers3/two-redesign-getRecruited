class Sport < ApplicationRecord
  belongs_to :athlete, optional: true

  has_one :diving, dependent: :destroy, foreign_key: :sport_id
  has_one :swimming, dependent: :destroy, foreign_key: :sport_id
  has_one :waterpolo, dependent: :destroy, foreign_key: :sport_id

  has_many :myteams, dependent: :destroy, foreign_key: :sport_id

  has_many :myprograms
  has_many :programs, through: :myprograms

  accepts_nested_attributes_for :myteams
  accepts_nested_attributes_for :myprograms
  accepts_nested_attributes_for :programs

  accepts_nested_attributes_for :diving
  accepts_nested_attributes_for :swimming
  accepts_nested_attributes_for :waterpolo

  validates :sportName, presence: true

end
