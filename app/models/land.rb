class Land < ActiveRecord::Base
  has_many :album_photos, as: :photoable
  attr_accessible :land_position_text, :description, :land_status, :price, :title, :avatar, :land_type, :location_latitude, :location_longitude, :location_address
  has_attached_file :avatar, :styles => { :medium => "244x180#", :thumb => "100x100>" }
  has_one :attachment
  
  def land_album_photo
    p_arr = Array.new
    self.album_photos.each do |ap|
      p_arr.push(ap.photo.url(:standard))
    end
    return p_arr
  end
  
  def self.count_land(land_type)
    self.where(land_type: land_type).count
  end

end
