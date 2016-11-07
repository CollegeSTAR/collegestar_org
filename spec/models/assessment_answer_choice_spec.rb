require 'spec_helper'

RSpec.describe AssessmentAnswerChoice do

  describe "Validations" do
    it { should validate_presence_of(:text) }
    it { should validate_presence_of(:position) }
  end

  describe "Associations" do
    it { should belong_to(:assessment_question) }
  end
end
