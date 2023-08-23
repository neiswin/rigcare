class AddUserIdToFaqs < ActiveRecord::Migration[7.0]
  def change
    add_reference :faqs, :user, foreign_key: true
  end
end
