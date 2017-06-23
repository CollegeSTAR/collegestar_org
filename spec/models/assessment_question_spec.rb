require 'spec_helper'

RSpec.describe AssessmentQuestion do

  describe 'validations' do
    it { should validate_presence_of(:question) }
  end
  
  describe 'associations' do
    it { should belong_to( :udl_module ) }
    it {should have_one( :correct_answer_choice).class_name( 'AssessmentAnswerChoice' ) }
    it { should have_many( :assessment_answer_choices ) }
    it { should have_many(:user_assessment_question_associations) }
  end
end
