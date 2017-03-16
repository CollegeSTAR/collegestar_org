class InstitutionalAdministrator < ActiveRecord::Base
  
  after_commit :update_parents

  validates :first_name, :last_name, :admin_email, presence: true
  validates_uniqueness_of :admin_email

  has_many :administrator_unit_associations, dependent: :destroy
  has_many :colleges, through: :administrator_unit_associations, source: :institutional_college
  has_many :departments, through: :administrator_unit_associations, source: :institutional_department

  private

  def update_parents
    query = <<-SQL.gsub(/\s+/, " ").strip
      UPDATE institutional_units
      SET updated_at = '#{Time.now.getutc}'
      FROM administrator_unit_associations
      WHERE administrator_unit_associations.institutional_administrator_id = #{self.id}
      AND administrator_unit_associations.institutional_unit_id = institutional_units.id
    SQL
    ActiveRecord::Base.connection.execute( query )
  end
end
