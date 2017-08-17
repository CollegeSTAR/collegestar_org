class StudentSupportProgramImage < ActiveRecord::Base
  
  belongs_to :student_support_program

  has_attached_file :image
  validates_attachment :image, presence: true,
  content_type: { content_type: /\Aimage\/.*\z/ }
end
