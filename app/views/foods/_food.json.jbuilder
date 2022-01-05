json.extract! food, :id, :name, :kind_id, :price, :memo, :is_deleted, :deleted_at, :created_at, :updated_at
json.url food_url(food, format: :json)
