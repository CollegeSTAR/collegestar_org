class AddCampusReferenceToFacultyNominationSurveys < ActiveRecord::Migration[5.0]
  def change
    add_reference :faculty_nomination_surveys, :campus, foreign_key: true
  end
end
