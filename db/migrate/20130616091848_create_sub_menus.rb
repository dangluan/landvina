class CreateSubMenus < ActiveRecord::Migration
  def change
    create_table :sub_menus do |t|
      t.string :name
      t.integer :priority, default: 0
      t.integer :menu_id
      t.string :link_to_article

      t.timestamps
    end
  end
end
