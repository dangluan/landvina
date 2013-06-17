class Article < ActiveRecord::Base
  attr_accessible :content, :sub_menu_id, :title
  belongs_to :sub_menu
end
