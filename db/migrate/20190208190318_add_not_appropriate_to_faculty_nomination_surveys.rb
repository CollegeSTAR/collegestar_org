class AddNotAppropriateToFacultyNominationSurveys < ActiveRecord::Migration[5.2]
  def change
    add_column :faculty_nomination_surveys, :not_appropriate, :boolean, default: false
  end
end
