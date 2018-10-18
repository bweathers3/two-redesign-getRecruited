class CounselorContact < ApplicationRecord
  belongs_to :athlete, optional: true
end
