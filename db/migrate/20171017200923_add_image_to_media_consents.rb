class AddImageToMediaConsents < ActiveRecord::Migration[5.1]
  def change
    add_attachment :media_consents, :image
  end
end
