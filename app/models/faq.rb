class Faq < ApplicationRecord
  belongs_to :user, optional: true
  has_rich_text :body


  validates :title, presence: true, length: { minimum: 2 }
  validates :body, presence: true, length: { minimum: 2 }
end
