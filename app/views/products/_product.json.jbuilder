json.extract! product, :id, :codigo, :nombre, :descripcion, :precio, :existencia, :category_id, :created_at, :updated_at
json.url product_url(product, format: :json)
