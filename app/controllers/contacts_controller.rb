class ContactsController < ApplicationController
  before_filter :authenticate_admin!
  def index
    load_data Contact
    render :layout => false
  end

  def edit
    @contact = Contact.find(params[:id])
    render :layout => false
  end
  
  def update
    @contact = Contact.find(params[:id])
    if @contact.update_attributes(params[:contact])
      load_data Contact
      render action: "index", layout: false
    else
      render :action => 'edit', layout: false
    end
  end

  def new
    @contact = Contact.new
    render :layout => false
  end
  
  def create 
    @Contact = Contact.new(params[:contact])
    if @contact.save
      load_data Contact
      render :action => 'index', :layout => false
    else
      render action: :edit, layout: false
    end
  end
  
  def show
    @contact = Contact.find(params[:id])
    @contact.mark_as_read = true
    render :action => 'show', layout: false
    @contact.save(validates: false)
  end
  
  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    load_data Contact
    render :action => 'index', :layout => false
  end

end
