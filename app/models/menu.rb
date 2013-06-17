class Menu < ActiveRecord::Base
  attr_accessible :name, :sub_menus_attributes, :priority
  has_many :sub_menus, dependent: :destroy
  accepts_nested_attributes_for :sub_menus, allow_destroy: true
end
