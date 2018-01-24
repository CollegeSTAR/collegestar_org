class CaseStudyProposal < ActiveRecord::Base
  
  ACCEPTED_STATUS = "Proposal Accepted"
  DENIED_STATUS = "Proposal Denied"
  PENDING_STATUS = "Pending"

  validates :first_name, :last_name, :university, :department, :email, 
            :title, :description, :strategy_link, :start_date, :completion_date,
            presence: true
  validates :module_type, presence: true, 
            udl_module_type: { 
              valid_module_types: 
              [
                'new_module', 
                'case_study'
              ] 
            }

  liquid_methods :first_name

  scope :pending, -> { where('accepted=? AND denied=?', false, false) }
  scope :accepted, -> { where(accepted: true) }
  scope :denied, -> { where(denied: true) }

  def pending
    return true if self.accepted == false && self.denied == false
    return false
  end

  def accepted=(value)
    self.denied = false if value == true
    super(value)
  end

  def denied=(value)
    self.accepted = false if value == true
    super(value)
  end

  def status
    if self.accepted
      return CaseStudyProposal::ACCEPTED_STATUS
    elsif self.denied
      return CaseStudyProposal::DENIED_STATUS
    else
      return CaseStudyProposal::PENDING_STATUS
    end
  end
end
