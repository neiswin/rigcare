class Faq < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :rig, optional: true
  has_rich_text :body

  has_many :faq_tags, dependent: :destroy
  has_many :tags, through: :faq_tags


  validates :title, presence: true, length: { minimum: 2 }
  validates :body, presence: true, length: { minimum: 2 }
end
