class Api::V1::ProductsController < ApiController
  before_action :set_product, only: [:show, :update, :destroy]

  # GET /products.json
  def index
    @products = Product.all
  end

  # GET /products/1.json
  def show
  end

  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.json { render action: 'show', status: :created, location: @product }
      else
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.json { head :no_content }
      else
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.json { head :no_content }
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