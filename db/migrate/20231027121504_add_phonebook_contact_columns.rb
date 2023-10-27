class AddPhonebookContactColumns < ActiveRecord::Migration[7.0]
  def change
    add_column :phonebook_contacts, :landline_phone_2, :string
    add_column :phonebook_contacts, :city_phone, :string
    add_column :phonebook_contacts, :work_mobile_phone, :string
    add_column :phonebook_contacts, :personal_mobile_phone_1, :string
    add_column :phonebook_contacts, :personal_mobile_phone_2, :string
  end
end
