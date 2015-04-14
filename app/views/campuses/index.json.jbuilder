json.array!(@campuses) do |campuse|
  json.extract! campuse, :id, :name, :abbreviation, :type, :director_id, :website_url, :address_1, :address_2, :city, :state, :zip, :image_url
  json.url campuse_url(campuse, format: :json)
end
