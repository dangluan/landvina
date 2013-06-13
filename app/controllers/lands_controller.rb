class LandsController < ApplicationController
  
  before_filter :authenticate_admin!
  layout "admin"
  include ApplicationHelper
  
  upload_album_for :lands
  def index
    load_data Land, {per_page: 10}
    render :layout => false
  end

  def new
    @land = Land.new
    render :layout => false
  end
  
  def create
    @land = Land.new(params[:land])
    if @land.save
      load_data Land
      response = render_to_string action: "index", layout: false
    else
      response = render_to_string action: "new", layout: false
    end
    load_response_from_iframe("#stage", response)
  end

  def edit
    @land = Land.find(params[:id])
    render :layout => false
  end
  
  def update
    @land = Land.find(params[:id])
    if @land.update_attributes(params[:land])
      load_data Land
      render :action => 'index', :layout => false
    else
      render :action => 'edit', :layout => false
    end
  end
  
  def upload_preview
    @land = Land.find(params[:id])
    render :partial => '/shared/upload_preview', :locals => { land: @land }
  end
  
  def destroy
    @land = Land.find(params[:id])
    @land.destroy
    load_data Land
    render :action => 'index', :layout => false
  end
end
