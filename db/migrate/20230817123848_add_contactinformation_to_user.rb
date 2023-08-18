class AddContactinformationToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :department, :string
    add_column :users, :position, :string
    add_column :users, :phone, :integer, :limit => 12
  end
end
