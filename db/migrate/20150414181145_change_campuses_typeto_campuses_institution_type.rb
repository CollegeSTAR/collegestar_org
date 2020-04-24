class ChangeCampusesTypetoCampusesInstitutionType < ActiveRecord::Migration[4.2]
  def change
    rename_column :campuses, :type, :institution_type
  end
end
