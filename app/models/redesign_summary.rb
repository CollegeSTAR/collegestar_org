class RedesignSummary < ActiveRecord::Base
  validates :first_name, :last_name, :title, 
            :department, :campus, :implemented_technique,
            :redesign_process, :assessment_description, :examples,
            :challenges, presence: true

  validate :must_select_atleast_one_udl_principle

  def must_select_atleast_one_udl_principle
    principle_checked = false
    [representation, action_expression, engagement].each do |principle|
      principle_checked = true if principle == true
    end

    if !principle_checked
      errors[:udl_principles] << "Atleast one(1) udl principle must be checked"
    end
  end
end
