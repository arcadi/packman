json.array!(@boxes) do |box|
  json.extract! box, :id, :name, :volume
  json.url api_v1_box_url(box, format: :json)
end
