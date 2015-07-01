json.array!(@udl_modules) do |udl_module|
  json.extract! udl_module, :id, :title, :slug, :sub_heading, :udl_principles, :description, :released, :release_date, :latest_revision_date
  json.url udl_module_url(udl_module, format: :json)
end
