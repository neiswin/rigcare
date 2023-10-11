class Tag < ApplicationRecord
  has_many :faq_tags, dependent: :destroy
  has_many :faqs, through: :faq_tags

  validates :title, presence: true, uniqueness: true
end
