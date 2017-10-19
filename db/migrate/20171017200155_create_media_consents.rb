class CreateMediaConsents < ActiveRecord::Migration[5.1]
  def change
    create_table :media_consents do |t|
      t.string :first_name
      t.string :last_name
      t.boolean :consent

      t.timestamps
    end
  end
end
