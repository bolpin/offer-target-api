class Locale < ApplicationRecord
  validates :code,
    presence: true,
    uniqueness: true
end
