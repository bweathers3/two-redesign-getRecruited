class Athlete < ApplicationRecord
  belongs_to :user

  has_many :sports, dependent: :destroy
  has_many :myteams, dependent: :destroy, foreign_key: :athlete_id

  has_one :academic, foreign_key: :athlete_id
  has_one :address, foreign_key: :athlete_id
  has_one :contact, foreign_key: :athlete_id
  has_one :counselor_contact, foreign_key: :athlete_id
  has_one :current_address, foreign_key: :athlete_id
  has_one :father_address, foreign_key: :athlete_id
  has_one :father_contact, foreign_key: :athlete_id
  has_one :mother_address, foreign_key: :athlete_id
  has_one :mother_contact, foreign_key: :athlete_id
  has_one :school_address, foreign_key: :athlete_id
  has_one :sibling, foreign_key: :athlete_id

  accepts_nested_attributes_for :myteams

  accepts_nested_attributes_for :academic
  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :contact
  accepts_nested_attributes_for :counselor_contact
  accepts_nested_attributes_for :current_address
  accepts_nested_attributes_for :father_address
  accepts_nested_attributes_for :father_contact
  accepts_nested_attributes_for :mother_address
  accepts_nested_attributes_for :mother_contact
  accepts_nested_attributes_for :school_address
  accepts_nested_attributes_for :sibling

  validates :firstName, length: { minimum: 1 }, presence: true
  validates :lastName, length: { minimum: 1 }, presence: true
  validates :yearStartingSchool, presence: true
  validates :user, presence: true
end
