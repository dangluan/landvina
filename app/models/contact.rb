class Contact < ActiveRecord::Base
  attr_accessible :address, :content, :email, :full_name, :phone, :yahoo_nick
end
