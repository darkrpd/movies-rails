json.array!(@films) do |film|
  json.extract! film, :id, :id, :name, :details
  json.url film_url(film, format: :json)
end
