class Tool < ApplicationRecord
  has_many :reservations

  enum status: %i[active inactive]
  enum tool_type: %i[tool room]

  validates :name, presence: true
end
