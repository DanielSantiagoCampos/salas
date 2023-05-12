class User < ApplicationRecord
  EMAIL_REGEX = /\A[a-zA-Z0-9.!\#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*\z/.freeze

  enum status: %i[active inactive]
  enum role: %i[administrator aux student teacher]

  validates :first_names, presence: true
  validates :password, length: { minimum: 8 }, if: -> { password.present? }
  validates :email, format: EMAIL_REGEX, presence: true, uniqueness: true
end
