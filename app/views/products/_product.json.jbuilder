json.extract! product, :id, :name, :artist, :price, :vinyl_weight, :catalog_number, :condition, :user_id, :created_at, :updated_at
json.url product_url(product, format: :json)
