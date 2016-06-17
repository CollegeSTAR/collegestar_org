RSpec.describe Campus do
  subject { create(:campus) }

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_presence_of(:slug) }
    it { should validate_uniqueness_of(:slug) }
    it { should validate_presence_of(:abbreviation) }
    it { should validate_uniqueness_of(:abbreviation) }
  end

  describe "associations" do
    it { should belong_to(:director) }
    it { should have_many(:units).class_name('CampusUnit') }
    it { should have_many(:departments).class_name('CampusDepartment') }
  end

  it "should find a campus by slug" do
    @campus = create(:campus)
    expect(Campus.find_by(slug: @campus.slug)).to eq(@campus)
  end
end
