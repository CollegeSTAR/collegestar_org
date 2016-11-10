require 'spec_helper'

RSpec.describe Page do
  
  let(:page) { create(:page) }

  describe 'Validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:slug) }
    it { should validate_presence_of(:text) }
    it { should validate_uniqueness_of(:slug) }
  end
  
  describe "guaranteed_find" do
    context "Given an existing page" do
      it "should find page by slug" do
        expect(Page.guaranteed_find slug: page.slug).to eq( page )
      end
    end
    context "Given a nonexisting page" do
      it "should return a NullPage" do
        expect(Page.guaranteed_find slug: "some-non-existing-slug").to be_kind_of( NullPage )
      end
    end
  end

  describe "#to_param" do
    it "should return slug" do
      expect(page.to_param).to eq(page.slug)  
    end
  end
end
