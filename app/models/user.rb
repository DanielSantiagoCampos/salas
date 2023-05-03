class User < ApplicationRecord
  EMAIL_REGEX = /\A[a-zA-Z0-9.!\#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*\z/.freeze

  enum status: %i[active inactive]
  enum role: %i[administrator aux student teacher]

  validates :first_names, presence: true
  validates :username, :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 8 }, if: -> { password.present? }
  validates :email, format: EMAIL_REGEX

  #validatable_enums :status, :role
end
