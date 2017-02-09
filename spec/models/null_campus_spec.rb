require "spec_helper"

RSpec.describe NullCampus do
  describe "name" do
    it "should return other for name" do
      expect(subject.name).to eq("Other")
    end
  end

  describe "abbreviation" do
    it "should return N/A for abbreviation" do
      expect(subject.abbreviation).to eq("N/A")
    end
  end

  describe "institution_type" do
    it "should return N/A for institution_type" do
      expect(subject.institution_type).to eq("N/A")
    end
  end

  describe "website_url" do
    it "should return N/A for website_url" do
      expect(subject.website_url).to eq("N/A")
    end
  end

  describe "address_1" do
    it "should return N/A for address_1" do
      expect(subject.address_1).to eq("N/A")
    end
  end  
  
  describe "address_2" do
    it "should return N/A for address_2" do
      expect(subject.address_2).to eq("N/A")
    end
  end
  
  describe "city" do
    it "should return N/A for city" do
      expect(subject.city).to eq("N/A")
    end
  end

  describe "state" do
    it "should return N/A for state" do
      expect(subject.state).to eq("N/A")
    end
  end

  describe "zip" do
    it "should return N/A for zip" do
      expect(subject.zip).to eq("N/A")
    end
  end

  describe "slug" do
    it "should return an empty string for slug" do
      expect(subject.slug).to eq("")
    end
  end

  describe "to_param" do
    it "should return slug" do
      expect(subject.to_param).to eq(subject.slug)
    end
  end
end
