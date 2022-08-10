class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]

  # GET /products or /products.json
  def index
    @products = Product.all
  end

  # GET /products/1 or /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to products_url, notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to products_url, notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def buscador
    @products = Product.order(:nombre)
  end

  def agregar_carrito

    cart = Cart.find_by(product_id: params[:id], user_id: current_user.id, pedido: 0)
    if cart
      cart.cantidad += 1
      cart.save
    else
      carrito = Cart.new()
      producto = Product.find(params[:id])
      carrito.product_id = producto.id
      carrito.cantidad = 1
      carrito.user_id = current_user.id
      carrito.precio = producto.precio
      carrito.pedido = 0
      carrito.save
    end  

    redirect_to buscar_producto_path
  end

  def disminuye_cantidad
    carrito = Cart.find(params[:id])

    if carrito.cantidad == 1
      carrito.delete
    else
      carrito.cantidad -= 1
      carrito.save
    end

    redirect_to carts_url
  end

  def aumenta_cantidad
    carrito = Cart.find(params[:id])
    carrito.cantidad += 1
    carrito.save

    redirect_to carts_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:codigo, :nombre, :descripcion, :precio, :existencia, :category_id, :image)
    end
end
