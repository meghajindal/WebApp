class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user   , only: [:create, :destroy]
  # GET /products
  # GET /products.json
  def index
    @products = Product.all
    @areas= Area.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @products }
    end
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
   # @products = Product.where("user_id= ?",current_user.id)
   # @product = @products.find(params[:id])
   # respond_to do |format|
      if @product.update_attributes(product_params)

       # redirect_to posting_path
       # format.html { redirect_to @product, notice: 'Product was successfully updated.' }
       # format.json { head :no_content }
      #  format.xml  { render :xml => @product }
      else
      #  format.html { render action: 'edit' }
       # format.json { render json: @product.errors, status: :unprocessable_entity }
      #  format.xml  { render :xml => @product }

     # end
      end
  end



  # POST /products
  # POST /products.json
  def create
     @product = current_user.products.build(product_params)
     #  @product = Product.new(product_params)

      if @product.save
        flash[:success] = "Product created!"
        redirect_to posting_path
      else
        render 'static_pages/home'
      end

  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update_attributes(product_params)
        format.html { redirect_to posting_path, notice: 'Product was successfully updated.' }
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
    @product = Product.find(params[:id])
   # respond_to do |format|
     if @product.destroy
      #  format.html { redirect_to :back }
       # format.json { :success => true }.as_json
       redirect_to :back
      else
       flash[:notice] = "Post failed to delete."
     #   format.html { redirect_to :back }
       # format.json { :success => false }.as_json

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

