class Tournament < ApplicationRecord
  has_many :standings
  has_many :users, through: :standings

  validates :tournament_name, presence: true
  validates :date, presence: true
  validates :start_time, presence: true
  validates :street_address, presence: true
  validates :state, presence: true
  validates :city, presence: true
  validates :zipcode, presence: true
  validates :details, presence: true
end
