class ChangeColumnUserPhonenumber < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :phone, :string, default: ''
  end
end
