json.array!(@campuses) do |campuse|
  json.extract! campuse, :id, :name, :image, :website, :address_1, :address_2, :director
  json.url campuse_url(campuse, format: :json)
end
