class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :role_users, inverse_of: :user
  has_many :roles, through: :role_users
  accepts_nested_attributes_for :role_users, :allow_destroy => true
  cattr_accessor :current_role
  attr_accessor :role_id, :user_id


  def has_role?(role)
    self.roles.map{|k,v| k.name}.include?(role)
  end

end
