class AddTitleImageToUdlModules < ActiveRecord::Migration[5.0]
  def change
    add_attachment :udl_modules, :title_image
  end
end
