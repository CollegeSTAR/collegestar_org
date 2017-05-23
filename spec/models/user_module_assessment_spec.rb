require 'spec_helper'

RSpec.describe UserModuleAssessment do
  
  describe "validations" do
    it { should validate_presence_of(:questions_order) }
  end

  describe "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:udl_module) }
    it { should have_many(:selected_answer_choices).class_name("UserAssessmentSelectedAnswerChoice") }
  end
end
