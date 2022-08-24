json.extract! cart, :id, :user_id, :fecha, :cantidad, :product_id, :precio, :pedido, :created_at, :updated_at
json.url cart_url(cart, format: :json)
