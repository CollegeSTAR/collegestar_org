require 'spec_helper'

RSpec.describe UdlModule do
    let(:udl_module) { create(:udl_module) }
    let(:case_study) { create(:case_study) }
    let(:introduction_section) { create(:introduction_section) }
    let(:udl_alignment_section) { create(:udl_alignment_section) }
    let(:instructional_practice_section) { create(:instructional_practice_section) }
    let(:learn_more_section) { create(:learn_more_section) }
    let(:references_resources_section) { create(:references_resources_section) }

  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_uniqueness_of(:title) }
    it { should validate_presence_of(:slug) }
    it { should validate_uniqueness_of(:slug) }
    it { should validate_presence_of(:module_type) }
  end

  describe "associations" do
    it { should have_many(:module_author_associations).with_foreign_key('module_id') }
    it { should have_many(:module_faculty_associations).with_foreign_key('module_id') }
    it { should have_many(:module_section_associations).with_foreign_key('module_id') }
    it { should have_many(:authors).through(:module_author_associations).class_name('User') }
    it { should have_many(:faculty).through(:module_faculty_associations).class_name('User') }
    it { should have_many(:sections).through(:module_section_associations).class_name('UdlModuleSection') }
    it { should have_many(:assessment_questions).dependent(:destroy) } 
    it { should have_many(:case_studies).class_name('UdlModule').with_foreign_key('module_id') }
    it { should have_many(:released_case_studies).class_name('UdlModule').with_foreign_key('module_id') }

    it { should have_attached_file(:title_image) }
  end

  describe "scopes" do
    context "released" do
      it "returns only released modules" do
        not_yet_released_module = create(:udl_module, released: false)
        released_module = create(:udl_module, released: true)
        expect(UdlModule.released).to match_array([released_module])
      end

      it "orders by title ascending" do
        released_module = create(:udl_module, released: true)
        second_released_module = create(:udl_module, title: 'AAAAAAA', released: true)
        expect(UdlModule.released).to eq([second_released_module, released_module])
      end
    end
    context "unreleased" do
      it "returns only unreleased modules" do
        not_yet_released_module = create(:udl_module, released: false)
        released_module = create(:udl_module, released: true)
        expect(UdlModule.unreleased).to match_array([not_yet_released_module])
      end

      it "orders by title ascending" do
        not_yet_released_module = create(:udl_module, released: false)
        second_not_yet_released_module = create(:udl_module, title: 'AAAAA', released: false)
        expect(UdlModule.unreleased).to eq([ second_not_yet_released_module, not_yet_released_module ])
      end
    end
    context "udl_modules" do
      it "only returns udl_modules" do
        udl_module = create(:udl_module, released: true)
        case_study 
        expect(UdlModule.udl_modules).to eq([ udl_module ])
      end
    end
    context "case_studies" do
      it "only returns case_studies" do
        udl_module = create(:udl_module, released: true)
        case_study
        expect(UdlModule.case_studies).to eq( [case_study] )
      end
    end
  end
  
  describe "#get_page_section_count" do
    let(:udl_module) { create(:udl_module) }
    let(:intro_section) { create(:introduction_section) }
    let(:udl_alignment_section) { create(:udl_alignment_section) }
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
      udl_module.add_section( udl_alignment_section )
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
      udl_module.add_section( udl_alignment_section )
      udl_module.add_section( instructional_practice_section )
      udl_module.add_section( learn_more_section )
      udl_module.add_section( references_resources_section )
      udl_module.save
    end
    
    it "returns only introduction_sections" do
      expect(udl_module.get_sections_by_page :introduction).to match_array([introduction_section]) 
    end
    
    it "returns only udl_alignment_sections" do
      expect(udl_module.get_sections_by_page :udl_alignment).to match_array([udl_alignment_section])
    end

    it "returns only instructional_practice_sections" do
      expect(udl_module.get_sections_by_page :instructional_practice).to match_array([instructional_practice_section])
    end    
    
    it "returns only learn_more_sections" do
      expect(udl_module.get_sections_by_page :learn_more).to match_array([learn_more_section])
    end

    it "returns only references_sections" do
      expect(udl_module.get_sections_by_page :references_resources).to match_array([references_resources_section])
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
