RSpec.describe Campus, :type => :model do
  it "should validate the presence of a name" do
    expect(build(:campus, name: nil)).to_not be_valid
  end

  it "should validate the uniqueness of name" do
    @campus = create(:campus)
    expect(build(:campus, name: @campus.name)).to_not be_valid
  end

  it "should validate the presence of a slug" do
    expect(build(:campus, name: nil)).to_not be_valid
  end

  it "should validate the uniqueness of a slug" do
    @campus = create(:campus)
    expect(build(:campus, slug: nil)).to_not be_valid
  end
  it "should find a campus by slug" do
    @campus = create(:campus)
    expect(Campus.find_by(slug: @campus.slug)).to eq(@campus)
  end

  it "should find campuses by featured bit"
end
