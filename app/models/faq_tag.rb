class FaqTag < ApplicationRecord
  belongs_to :faq
  belongs_to :tag
end
