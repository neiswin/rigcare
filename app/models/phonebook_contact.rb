class PhonebookContact < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :department, presence: true
  validates :position, presence: true
end
