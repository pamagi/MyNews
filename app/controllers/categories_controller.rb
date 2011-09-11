class CategoriesController < ApplicationController
  respond_to :html
  before_filter :authenticate_user!

  # GET /categories
  def index
    @categories = Category.all
    respond_with(@categories)
  end

  # GET /categories/1
  def show
    @category = Category.find(params[:id])
    respond_with(@category)
  end

  # GET /categories/new
  def new
    @category = Category.new
    respond_with(@category)
  end

  # GET /categoriess/1/edit
  def edit
    @category = Category.find(params[:id])
    authorize! :update, @category
    respond_with(@category)
  end

  # POST /categories
  def create
    @category = Category.new(params[:category])
    respond_with(@category.tap(&:save))
  end

  # PUT /categories/1
  def update
    @category = Category.find(params[:id])
    authorize! :update, @category
    @category.update_attributes(params[:category])
    respond_with(@category)
  end

  # DELETE /categories/1
  def destroy
    @category = Category.find(params[:id])
    authorize! :destroy, @category
    @category.destroy
    respond_with(@category)
  end
end
