class CreateRedesignSummaryAttachments < ActiveRecord::Migration[4.2]
  def change
    create_table :redesign_summary_attachments do |t|
      t.attachment :attachment
      t.string :redesign_summary_uuid, index: true, null: false
      t.belongs_to :redesign_summary, index: true

      t.timestamps
    end
  end
end
