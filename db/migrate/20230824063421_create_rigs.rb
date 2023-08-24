class CreateRigs < ActiveRecord::Migration[7.0]
  def change
    create_table :rigs do |t|
      t.string :rig_type

      t.timestamps
    end
  end
end
