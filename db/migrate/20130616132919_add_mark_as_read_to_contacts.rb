class AddMarkAsReadToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :mark_as_read, :boolean, default: false, null: false
  end
end
