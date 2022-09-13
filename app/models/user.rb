class User < ApplicationRecord
  has_many :standings
  has_many :tournaments, through: :standings

  has_secure_password
  validates :email, presence: true, uniqueness: true, length: { maximum: 50 }
  validates :first_name, presence: true, length: { maximum: 20 }
  validates :last_name, presence: true, length: { maximum: 20 }
  validates :password, presence: true, length: { minimum: 8 }
  validates :password_confirmation, presence: true
end
