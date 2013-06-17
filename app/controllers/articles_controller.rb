class ArticlesController < ApplicationController
  before_filter :authenticate_admin!
  def index
    load_data Article
    render :layout => false
  end

  def edit
    @article = Article.find(params[:id])
    render :layout => false
  end
  
  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(params[:article])
      load_data Article
      render action: "index", layout: false
    else
      render :action => 'edit', layout: false
    end
  end

  def new
    @article = Article.new
    render :layout => false
  end
  
  def create 
    @article = Article.new(params[:article])
    if @article.save
      load_data Article
      render :action => 'index', :layout => false
    else
      render action: :edit, layout: false
    end
  end
  
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    load_data Article
    render :action => 'index', :layout => false
  end
end
