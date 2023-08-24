class AddToRigIdToFaqs < ActiveRecord::Migration[7.0]
  def change
    add_reference :faqs, :rig, foreign_key: true
  end
end
