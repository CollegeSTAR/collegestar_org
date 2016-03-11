module AddressHelper
  def format_address( model )
    address = "#{model.address_1} <br />"
    address += "#{model.address_2} <br />" if model.address_2
    address += "#{model.city}, #{model.state} #{model.zip}"
    address.html_safe
  end
end
