class Filial < ApplicationRecord
  has_many :lines, inverse_of: :filial

  validates :name, presence: true
  validates :description, presence: true
end
