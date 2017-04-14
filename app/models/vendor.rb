# Vendor record
class Vendor < ApplicationRecord
  validates :name,
            presence: true,
            uniqueness: true
end
