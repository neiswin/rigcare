class Equipment < ApplicationRecord
  validates :title, presence: true, length: { minimum: 2 }
  validates :amount, presence: true, numericality: { only_integer: true }

end
