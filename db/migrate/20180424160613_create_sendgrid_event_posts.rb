class CreateSendgridEventPosts < ActiveRecord::Migration[5.1]
  def change
    create_table :sendgrid_event_posts do |t|
      t.json :data

      t.timestamps
    end
  end
end
