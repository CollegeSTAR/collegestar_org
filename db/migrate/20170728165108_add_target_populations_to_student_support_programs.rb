class AddTargetPopulationsToStudentSupportPrograms < ActiveRecord::Migration[5.1]
  def change
    add_column :student_support_programs, :target_population_specified_ld, :boolean
    add_column :student_support_programs, :target_population_adhd, :boolean
    add_column :student_support_programs, :target_population_aut_asp, :boolean
    add_column :student_support_programs, :target_population_efc, :boolean
    add_column :student_support_programs, :target_population_other, :string
  end
end
