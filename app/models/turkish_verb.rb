class TurkishVerb < ApplicationRecord
  validates :turkish, presence: true
  validates :english, presence: true
end