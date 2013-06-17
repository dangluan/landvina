class MenusController < ApplicationController
  before_filter :authenticate_admin!
  def index
    load_data Menu
    render :layout => false
  end

  def edit
    @menu = Menu.find(params[:id])
    render :layout => false
  end
  
  def update
    @menu = Menu.find(params[:id])
    if @menu.update_attributes(params[:menu])
      load_data Menu
      render action: "index", layout: false
    else
      render :action => 'edit', layout: false
    end
  end

  def new
    @menu = Menu.new
    render :layout => false
  end
  
  def create 
    @menu = Menu.new(params[:menu])
    if @menu.save
      load_data Menu
      render :action => 'index', :layout => false
    else
      render action: :edit, layout: false
    end
  end
  
  def destroy
    @menu = Menu.find(params[:id])
    @menu.destroy
    load_data Menu
    render :action => 'index', :layout => false
  end
end
