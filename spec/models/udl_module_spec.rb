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
    it "has many modules_authors" do
      is_expected.to have_many(:modules_authors).with_foreign_key('author_module_id')
    end    
    it "has many modules_contributing_faculty" do
      is_expected.to have_many(:modules_contributing_faculty).with_foreign_key('faculty_module_id')
    end
    it "has many modules_sections" do
      is_expected.to have_many(:modules_sections).with_foreign_key('section_module_id')
    end
    it "has many authors" do
      is_expected.to have_many(:authors).through(:modules_authors).class_name('User')
    end
    it "has many contributing faculty" do
      is_expected.to have_many(:contributing_faculty).through(:modules_contributing_faculty).class_name('User')
    end
    it "has many sections" do
      is_expected.to have_many(:sections).through(:modules_sections).class_name('UdlModuleSection')
    end
    xit "has one assessment" do
      is_expected.to have_one(:assessment)
    end
  end
end
