require 'spec_helper'

RSpec.describe UdlModule do
    let(:udl_module) { create(:udl_module) }
    let(:introduction_section) { create(:introduction_section) }
    let(:udl_principles_section) { create(:udl_principles_section) }
    let(:instructional_practice_section) { create(:instructional_practice_section) }
    let(:learn_more_section) { create(:learn_more_section) }
    let(:references_section) { create(:references_section) }

  describe "validations" do
    it "validates presence of a title" do
      is_expected.to validate_presence_of(:title)
    end
    it "validates uniqueness of title" do
      is_expected.to validate_uniqueness_of(:title)
    end
    it "validates presence of slug" do
      is_expected.to validate_presence_of(:slug)
    end
    it "validates uniqueness of slug" do
      is_expected.to validate_uniqueness_of(:slug)
    end
  end

  describe "associations" do
    it "has many module_author_associations" do
      is_expected.to have_many(:module_author_associations).with_foreign_key('module_id')
    end    
    it "has many modules_contributing_faculty" do
      is_expected.to have_many(:module_faculty_associations).with_foreign_key('module_id')
    end
    it "has many module_section_associations" do
      is_expected.to have_many(:module_section_associations).with_foreign_key('module_id')
    end
    it "has many authors" do
      is_expected.to have_many(:authors).through(:module_author_associations).class_name('User')
    end
    it "has many faculty" do
      is_expected.to have_many(:faculty).through(:module_faculty_associations).class_name('User')
    end
    it "has many sections" do
      is_expected.to have_many(:sections).through(:module_section_associations).class_name('UdlModuleSection')
    end
    xit "has one assessment" do
      is_expected.to have_one(:assessment)
    end
  end
  
  describe "#get_sections_by_page" do
    before(:each) do
      udl_module.sections << introduction_section
      udl_module.sections << udl_principles_section
      udl_module.sections << instructional_practice_section
      udl_module.sections << learn_more_section
      udl_module.sections << references_section
    end
    
    it "returns only introduction_sections" do
      expect(udl_module.get_sections_by_page :introduction).to match_array([introduction_section]) 
    end
    
    it "returns only udl_principle_sections" do
      expect(udl_module.get_sections_by_page :udl_principles).to match_array([udl_principles_section])
    end

    it "returns only instructional_practice_sections" do
      expect(udl_module.get_sections_by_page :instructional_practice).to match_array([instructional_practice_section])
    end    
    
    it "returns only learn_more_sections" do
      expect(udl_module.get_sections_by_page :learn_more).to match_array([learn_more_section])
    end

    it "returns only references_sections" do
      expect(udl_module.get_sections_by_page :references).to match_array([references_section])
    end
    
    it "should order by position" do
      udl_module.sections.delete introduction_section.id
      intro_section_two = create(:introduction_section)
      udl_module.sections << intro_section_two
      udl_module.sections << introduction_section
      expect(udl_module.get_sections_by_page :introduction).to eq([introduction_section, intro_section_two])
    end
  end
end
