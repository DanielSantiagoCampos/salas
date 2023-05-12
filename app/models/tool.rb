class Tool < ApplicationRecord
  enum status: %i[active inactive]
end
