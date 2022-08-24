json.extract! order, :id, :fecha, :folio, :customer_id, :estatus, :total, :created_at, :updated_at
json.url order_url(order, format: :json)
