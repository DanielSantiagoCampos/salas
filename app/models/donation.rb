class Donation < ApplicationRecord
  belongs_to :user

  enum status: %i[requested received]
end
