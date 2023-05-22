json.extract! bike, :id, :name, :desc, :style, :price, :created_at, :updated_at
json.url bike_url(bike, format: :json)
