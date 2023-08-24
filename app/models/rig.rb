class Rig < ApplicationRecord
  has_many :faqs, dependent: :destroy

  validates :rig_type, presence: true, length: { minimum: 2 }
end
