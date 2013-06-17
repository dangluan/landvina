class AddPriorityToMenus < ActiveRecord::Migration
  def change
    add_column :menus, :priority, :integer, default: 0
  end
end
