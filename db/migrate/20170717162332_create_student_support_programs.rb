class CreateStudentSupportPrograms < ActiveRecord::Migration[5.1]
  def change
    create_table :student_support_programs do |t|
      t.string :name
      t.string :slug
      t.string :video_link
      t.text :mission_statement
      t.text :description_of_services
      t.text :program_overview
      t.text :program_size
      t.text :resources
      t.text :contact_info
      t.boolean :public
      t.boolean :fee_based
      t.string :program_cost
      t.string :target_population
      t.string :institution_size
      t.string :institution_type
      t.text :application_process
    end
  end
end
