class ChangeColumnUser < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :department, :integer, using: 'department::integer', default: 0
    change_column :users, :position, :integer, using: 'position::integer', default: 0
  end
end
