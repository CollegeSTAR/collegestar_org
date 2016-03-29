class RedesignSummary < ActiveRecord::Base
  after_initialize :generate_uuid

  validates :implemented_technique, :summary_content, presence: true
  validate :must_select_atleast_one_udl_principle

  has_many :attachments, -> { distinct }, class_name: RedesignSummaryAttachment, dependent: :destroy
  belongs_to :user

  def add_existing_attachments( args={} )
    attachment_klass = args.fetch( :attachment_klass, RedesignSummaryAttachment)
    summary_attachments = attachment_klass.where( redesign_summary_uuid: uuid )
    summary_attachments.each do |attachment|
      attachments << attachment
    end
  end
  
  private

  def must_select_atleast_one_udl_principle
    principle_checked = false
    [representation, action_expression, engagement].each do |principle|
      principle_checked = true if principle == true
    end

    if !principle_checked
      errors[:udl_principles] << "Atleast one(1) udl principle must be checked"
    end
  end

  def generate_uuid
    self.uuid ||= SecureRandom.uuid
  end
end
