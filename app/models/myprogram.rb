class Myprogram < ApplicationRecord
  belongs_to :sport, optional: true
  belongs_to :program, optional: true
end
