class Section < ApplicationRecord
  belongs_to :task
  has_many :lines, inverse_of: :section

  validates :kind, presence: true
  # validates :task_id, presence: true
end
