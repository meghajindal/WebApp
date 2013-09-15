class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user   , only: [:create, :destroy]
  # GET /products
  # GET /products.json
  def index
    @products = Product.all
    @areas= Area.all
  end

  def post1
    @products = Product.where("user_id= ?",current_user.id)
    # @areas= Area.all
  end
  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
    @products = Product.where("user_id= ?",current_user.id)
    @product = @products.find(params[:id])
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
       # format.html { render action: 'edit' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /products
  # POST /products.json
  def create
    # @product = current_user.products.build(product_params)
       @product = Product.new(product_params)

      if @product.save
        flash[:success] = "Product created!"
        redirect_to root_url
      else
        render 'static_pages/home'
      end

  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
     # params.require(:product).permit(:prod_name)
     # params.require(:product).permit(:prod_name, :user_id, :cat_id )
      if params[:product].present?
        params.require(:product).permit(:prod_name, :user_id, :cat_id )
        end
    end
end

