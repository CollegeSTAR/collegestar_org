class ChangeCampusesTypetoCampusesInstitutionType < ActiveRecord::Migration
  def change
    rename_column :campuses, :type, :institution_type
  end
end
