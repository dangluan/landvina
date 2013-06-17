class SubMenusController < ApplicationController
  before_filter :authenticate_admin!
  def index
    load_data SubMenu
    render :layout => false
  end

  def edit
    @submenu = SubMenu.find(params[:id])
    render :layout => false
  end
  
  def update
    @submenu = SubMenu.find(params[:id])
    if @submenu.update_attributes(params[:sub_menu])
      load_data SubMenu
      render action: "index", layout: false
    else
      render :action => 'edit', layout: false
    end
  end

  def new
    @submenu = SubMenu.new
    render :layout => false
  end
  
  def create 
    @submenu = SubMenu.new(params[:sub_menu])
    if @submenu.save
      load_data SubMenu
      render :action => 'index', :layout => false
    else
      render action: :edit, layout: false
    end
  end
  
  def destroy
    @submenu = SubMenu.find(params[:id])
    @submenu.destroy
    load_data SubMenu
    render :action => 'index', :layout => false
  end

end
