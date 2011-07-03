class ArticlesController < ApplicationController
  respond_to :html
  before_filter :authenticate_user!, :except => [:index, :show]
  
  # GET /articles
  def index
    @articles = collection
    respond_with(@articles)
  end

  # GET /articles/1
  def show
    @article = Article.find(params[:id])
    authorize! :read, @article
    respond_with(@article)
  end

  # GET /articles/new
  def new
    @article = Article.new
    respond_with(@article)
  end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])
    authorize! :update, @article
    respond_with(@article)
  end

  # POST /articles
  def create
    @article = current_user.articles.build(params[:article])
    respond_with(@article.tap(&:save))
  end

  # PUT /articles/1
  def update
    @article = Article.find(params[:id])
    authorize! :update, @article
    @article.update_attributes(params[:article])
    respond_with(@article)
  end

  # DELETE /articles/1
  def destroy
    @article = Article.find(params[:id])
    authorize! :destroy, @article
    @article.destroy
    respond_with(@article)
  end

  protected
  
  def parent
    return Category.find(params[:category_id]) if params.key?(:category_id)
  end
  def collection
    (parent.try(:articles) || Article).scoped
  end
end
