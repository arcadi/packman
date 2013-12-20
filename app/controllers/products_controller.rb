class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  def index
    @products = Product.all
  end

  # GET /products/1
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to products_path, notice: 'Product was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /products/1
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to products_path, notice: 'Product was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /products/1
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_path }
    end
  end

  # GET /products/typeahead.json
  def typeahead
    @products = Product.search(params[:query], params[:exclude])
    respond_to do |format|
      format.json
    end
  end

  private

    def set_product
      @product = Product.find_by_param(params[:id])
    end

    def product_params
      params.require(:product).permit(:number, :name, :width, :height, :depth, :weight, :stock_level)
    end
end
