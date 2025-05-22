class CreateEquipment < ActiveRecord::Migration[7.0]
  def change
    create_table :equipment do |t|
      t.string :title
      t.string :manufacturer
      t.string :part_number
      t.text :description
      t.integer :amount, default: 0

      t.timestamps
    end
  end
end
