class UdlModule < ActiveRecord::Base
  
  has_one :author, class_name: "User"
  has_many :sections
  has_many :contributing_faculty, class_name: "User"
  has_many :assessment_questions
  has_many :assessment_question_answer_choices
end
