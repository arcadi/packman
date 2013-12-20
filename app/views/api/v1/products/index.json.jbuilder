json.array!(@products) do |product|
  json.extract! product, :number, :name, :width, :height, :depth, :weight, :stock_level, :volume
  json.url api_v1_product_url(product, format: :json)
end
