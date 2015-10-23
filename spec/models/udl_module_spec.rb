require 'spec_helper'

RSpec.describe UdlModule do
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
end
