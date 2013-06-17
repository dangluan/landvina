class Contact < ActiveRecord::Base
  attr_accessible :address, :content, :email, :full_name, :phone, :yahoo_nick
  
  def self.mark_as_unread
    self.where(mark_as_read: false).count
  end
end
