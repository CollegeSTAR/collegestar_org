json.array!(@events) do |event|
  json.extract! event, :id, :name, :registration_open_datetime, :registration_close_datetime, :max_registrants, :start_datetime, :end_datetime, :address, :address_2, :city, :state, :zip_code
  json.url event_url(event, format: :json)
end
