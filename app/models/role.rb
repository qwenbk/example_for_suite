class Role < ApplicationRecord
  has_and_belongs_to_many :users, :join_table => :role_users
  validates :name, presence: true
  # validates :description, presence: true
end
