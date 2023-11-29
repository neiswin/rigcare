class CreatePhonebookContacts < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'citext' unless extension_enabled?('citext')
    
    create_table :phonebook_contacts do |t|
      t.string :department
      t.string :position
      t.string :first_name
      t.string :last_name
      t.string :surname
      t.string :landline_phone_1

      t.timestamps
    end
  end
end
