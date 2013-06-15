class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :full_name
      t.string :address
      t.integer :phone
      t.string :yahoo_nick
      t.string :email
      t.text :content

      t.timestamps
    end
  end
end
