class CreateSendgridEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :sendgrid_events do |t|
      t.string :sg_event_id
      t.string :sg_message_id
      t.string :event
      t.string :email
      t.timestamp :timestamp
      t.string :smtp_id
      t.string :ip
      t.boolean :tls
      t.boolean :cert_err
      
      t.string :timestamps
    end

    add_index :sendgrid_events, :sg_event_id, unique: true
  end
end
