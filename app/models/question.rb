class Question < ApplicationRecord
  validates :pri, presence: true
  validates :quiz, presence: true
  validates :teamingStages, presence: true
  validates :appearsDay, presence: true
  validates :frequency, presence: true
  validates :qType, presence: true
  validates :required, presence: true
  validates :conditions, presence: true

end
