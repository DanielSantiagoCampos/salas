class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :tool

  validates :range, numericality: true
end
