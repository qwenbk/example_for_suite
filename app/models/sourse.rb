class Sourse < ApplicationRecord
  belongs_to :reason

  # validates :reason_id, presence: true
  validates :kind, presence: true
  validates :kind1, presence: true
  validates :number, presence: true
  validates :date_of, presence: true
  validates :value, numericality: { only_integer: true }
end
