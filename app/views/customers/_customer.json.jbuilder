json.extract! customer, :id, :codigo, :nombre, :paterno, :materno, :rut, :nombre_complet, :direccion, :ciudad, :pais, :telefono, :correo, :user_id, :created_at, :updated_at
json.url customer_url(customer, format: :json)
