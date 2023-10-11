class CreateFaqTags < ActiveRecord::Migration[7.0]
  def change
    create_table :faq_tags do |t|
      t.belongs_to :faq, null: false, foreign_key: true
      t.belongs_to :tag, null: false, foreign_key: true

      t.timestamps
    end

    add_index :faq_tags, [:faq_id, :tag_id], unique: true
  end
end
