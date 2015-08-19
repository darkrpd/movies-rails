json.array!(@casts) do |cast|
  json.extract! cast, :id
  json.url cast_url(cast, format: :json)
end
