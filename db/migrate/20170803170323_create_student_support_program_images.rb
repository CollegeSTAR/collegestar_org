class CreateStudentSupportProgramImages < ActiveRecord::Migration[5.1]
  def change
    create_table :student_support_program_images do |t|
      t.attachment :image
      t.string :caption
      t.references :student_support_program, foreign_key: true, index: { name: 'index_student_support_program_images_id' }
    end
  end
end
