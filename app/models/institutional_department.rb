class InstitutionalDepartment < InstitutionalUnit
  
  after_commit :update_parents, on: :update
  
  belongs_to :institutional_unit
  has_many :administrator_unit_associations, foreign_key: :institutional_unit_id, dependent: :destroy
  has_many :chairs, -> { distinct }, through: :administrator_unit_associations, source: :institutional_administrator
  has_one :current_chair_unit_association, -> { where current_chair: true }, 
                                            class_name: 'AdministratorUnitAssociation', 
                                            foreign_key: :institutional_unit_id, 
                                            dependent: :destroy  
  has_one :current_chair, through: :current_chair_unit_association, source: :institutional_administrator
  has_many :department_faculty_associations, foreign_key: :department_id, dependent: :destroy
  has_many :faculty, through: :department_faculty_associations

  private

  def update_parents
    query = <<-SQL.gsub(/\s+/, " ").strip
      UPDATE institutional_units
      SET updated_at='#{Time.now.getutc}'
      WHERE id=#{self.institutional_unit_id}
    SQL
    ActiveRecord::Base.connection.execute( query )
  end
end
