require 'rails_helper'

RSpec.describe StudentNomination do
  
  describe "validations" do
    it { should validate_presence_of(:strategy_name) }
    it { should validate_presence_of(:strategy_description) }
    it { should validate_presence_of(:strategy_effectiveness) }
    it { should validate_presence_of(:student_nomination_faculty_id) }
  end

  describe "associations" do
    it { should belong_to(:faculty_member)
           .class_name('StudentNominationFaculty')
           .with_foreign_key('student_nomination_faculty_id') 
       }
  end
end
