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
    it { should have_many(:assessment_questions)} 
  end

  describe "scopes" do
    context "released" do
      it "returns only released modules" do
        not_yet_released_module = create(:udl_module)
        released_module = create(:udl_module, released: true)
        expect(UdlModule.released).to match_array([released_module])
      end
    end
  end
  
  describe "#get_page_section_count" do
    let(:udl_module) { create(:udl_module) }
    let(:intro_section) { create(:introduction_section) }
    let(:udl_principles_section) { create(:udl_principles_section) }
    it "returns 0 when page has no sections" do
      expect(udl_module.get_page_section_count("introduction")).to eq(0)
    end
    it "returns 1 when page has one section" do
      udl_module.add_section( intro_section )
      udl_module.save
      expect(udl_module.get_page_section_count("introduction")).to eq(1)
    end
    it "returns 2 when page has two sections" do
      udl_module.add_section( intro_section )
      udl_module.add_section( intro_section )
      udl_module.save
      expect(udl_module.get_page_section_count("introduction")).to eq(2)
    end
    it "returns 1 when two sections exist in different pages" do
      udl_module.add_section( intro_section )
      udl_module.add_section( udl_principles_section )
      udl_module.save
      expect(udl_module.get_page_section_count("introduction")).to eq(1)
    end
  end

  describe "#add_section" do
    let(:udl_module){ create(:udl_module) }
    let(:udl_module_section){ create(:udl_module_section) }
    let(:udl_module_section_two){ create(:udl_module_section) }
    let(:shared_udl_module_section) { build(:shared_introduction_section, default_shared_position: 2) }
    it "adds section to sections collection" do
      udl_module.add_section( udl_module_section )
      expect(udl_module.sections).to match_array([udl_module_section])
    end
    it "sets section position" do
      udl_module.add_section( udl_module_section )      
      expect(
        udl_module.module_section_associations
        .where( section_id: udl_module_section)
        .first
        .section_page_position
      ).to eq(1)
    end
    it "sets section position to next available position in page" do   
      udl_module.add_section( udl_module_section )      
      udl_module.add_section( udl_module_section_two )
        expect(
          udl_module.module_section_associations
            .where( section_id: udl_module_section_two)
            .first
            .section_page_position
        ).to eq(2)
    end

    context "shared section" do
      it "uses default_shared_position" do
        udl_module.add_section( shared_udl_module_section )
        expect(
          udl_module.module_section_associations
            .where( section_id: shared_udl_module_section )
            .first
            .section_page_position
        ).to eq(2)
      end
    end
  end

  describe "#get_sections_by_page" do
    before(:each) do
      udl_module.add_section( introduction_section )
      udl_module.add_section( udl_principles_section )
      udl_module.add_section( instructional_practice_section )
      udl_module.add_section( learn_more_section )
      udl_module.add_section( references_section )
      udl_module.save
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
      expect(udl_module.get_sections_by_page :introduction).to eq([intro_section_two, introduction_section])
    end
  end
end
