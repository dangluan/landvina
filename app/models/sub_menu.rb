class SubMenu < ActiveRecord::Base
  attr_accessible :link_to_article, :menu_id, :name, :priority
  belongs_to :menu
end
