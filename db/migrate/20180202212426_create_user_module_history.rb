class CreateUserModuleHistory < ActiveRecord::Migration[5.1]
  def change
    create_table :user_module_histories do |t|
      t.references :udl_module, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamp :last_viewed
      t.boolean :assessment_attempted
      t.boolean :assessment_passed
      
      t.timestamps
    end
  end
end
