require 'spec_helper'

RSpec.describe UserModuleAssessment do
  
  describe "validations" do
    it { should validate_presence_of(:questions_order) }
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:udl_module) }
  end

  describe "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:udl_module) }
    it { should belong_to(:user_module_history) }
    it { should have_many(:user_assessment_question_associations)
           .order("position")
       }
    it { should have_many(:questions)
           .through(:user_assessment_question_associations)
           .source(:assessment_question)
       }
  end
end
