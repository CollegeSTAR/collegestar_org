class AddReviewedToFacultyNominationSurveys < ActiveRecord::Migration[5.0]
  def change
    add_column :faculty_nomination_surveys, :reviewed, :boolean
  end
end
