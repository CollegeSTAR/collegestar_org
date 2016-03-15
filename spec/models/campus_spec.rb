RSpec.describe Campus do
  subject { create(:campus) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should validate_presence_of(:slug) }
  it { should validate_uniqueness_of(:slug) }
  it { should validate_presence_of(:abbreviation) }
  it { should validate_uniqueness_of(:abbreviation) }
  it { should belong_to(:director) }
  it "should find a campus by slug" do
    @campus = create(:campus)
    expect(Campus.find_by(slug: @campus.slug)).to eq(@campus)
  end
end
