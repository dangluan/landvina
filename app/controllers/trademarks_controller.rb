class TrademarksController < ApplicationController
  before_filter :authenticate_admin!
  
  upload_album_for :trademarks
  
  def index
    
  end

  def edit
    
  end

  def new
    @trademark = Trademark.new
    render :layout => false
  end
end
