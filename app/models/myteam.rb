class Myteam < ApplicationRecord
  belongs_to :sport, optional: true
  belongs_to :athlete, optional: true
end
