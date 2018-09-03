class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_create :set_firstName
  before_create :set_lastName

  private

  def set_firstName
    self.firstName.titeize
  end

  def set_lastName
    self.lastName.titeize
  end
end
