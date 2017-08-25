class AddSharedResourceProblemToStudentSupportSummitRegistrations < ActiveRecord::Migration[5.1]
  def change
    add_column :student_support_summit_registrations, :shared_resource, :text
    add_column :student_support_summit_registrations, :shared_problem, :text
  end
end
