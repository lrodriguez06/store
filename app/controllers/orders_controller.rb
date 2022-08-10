class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]

  # GET /orders or /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1 or /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders or /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to order_url(@order), notice: "Order was successfully created." }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to order_url(@order), notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def genera_pedido
    @carrito = Cart.where(user_id: current_user.id, pedido: 0)
  end

  def confirma_pedido
    @carrito = Cart.where(user_id: params[:id], pedido: 0)
    cliente = Customer.find_by(user_id: params[:id])

    if cliente && @carrito
      folio = Order.count(:id) + 1
      total = @carrito.sum("cantidad * precio")
      orden = Order.new
      orden.fecha = Time.now
      orden.folio = folio
      orden.customer_id = cliente.id
      orden.estatus = 1
      orden.total = total
      orden.save

      @carrito.each do |cart|
        detalle = OrderDetail.new
        detalle.order_id = orden.id
        detalle.product_id = cart.product_id
        detalle.cantidad = cart.cantidad
        detalle.precio = cart.precio
        detalle.save
      end

      @carrito.update(pedido: 1)

      @orden_id = orden.id
    else
      
    end

  end
 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:fecha, :folio, :customer_id, :estatus, :total)
    end
end
