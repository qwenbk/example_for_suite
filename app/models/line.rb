class Line < ApplicationRecord
  belongs_to :section
  belongs_to :filial
  has_many :reasons, inverse_of: :line

  validates :filial_id, presence: true
  # validates :recruitment, numericality: { only_integer: true }
  # validates :release, numericality: { only_integer: true }
  # validates :studying, numericality: { only_integer: true }
  validates :registry_number, presence: true
  validates :period, presence: true
  validates :level, presence: true
  validates :specialty, presence: true
  validates :form_of_training, presence: true
  validates :ovz, presence: true
  validates :section_id, presence: true
  validates :mark, presence: true, numericality: true
end
