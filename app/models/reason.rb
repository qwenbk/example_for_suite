class Reason < ApplicationRecord
  belongs_to :line
  has_many :sourses, inverse_of: :reason, dependent: :destroy

  validates :name, presence: true
  validates :kind, presence: true
  # validates :line, presence: true
  validates :value, numericality: { only_integer: true }, presence: true
  accepts_nested_attributes_for :sourses, :allow_destroy => true

  # validate :check_sum
  def check_sum
    if value.present?
      if value != sourses.sum("sourses.value")
        errors.add("#{sourses.sum("sourses.value")}", "не соответствует сумме значений отклонений по приказам")
      end
    end
  end

end
