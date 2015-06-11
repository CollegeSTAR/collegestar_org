RSpec.describe Campus, :type => :model do
  it "should validate the presence of a name" do
    @campus = build(:campus, name: nil)
    @campus.valid?
    expect(@campus.errors[:name].size).to eq(1)
  end

  it "should validate the uniqueness of name" do
    @campus_1 = create(:campus)
    @campus_2 = build(:campus, name: @campus_1.name)
    @campus_2.valid?
    expect(@campus_2.errors[:name].size).to eq(1)
  end

  it "should validate the presence of a slug" do
    @campus = build(:campus, slug: nil)
    @campus.valid?
    expect(@campus.errors[:slug].size).to eq(1)
  end

  it "should validate the uniqueness of a slug" do
    @campus_1 = create(:campus)
    @campus_2 = build(:campus, slug: @campus_1.slug)
    @campus_2.valid?
    expect(@campus_2.errors[:slug].size).to eq(1)
  end

  it "should validate the presence of an abbreviation" do
    @campus = build(:campus, abbreviation: nil)
    @campus.valid?
    expect(@campus.errors[:abbreviation].size).to eq(1)
  end

  it "should validate the uniqueness of an abbreviation" do
    @campus_1 = create(:campus)
    @campus_2 = build(:campus, abbreviation: @campus_1.abbreviation)
    @campus_2.valid?
    expect(@campus_2.errors[:abbreviation].size).to eq(1)
  end

  it "should find a campus by slug" do
    @campus = create(:campus)
    expect(Campus.find_by(slug: @campus.slug)).to eq(@campus)
  end

  it "should find campuses by featured bit"
end
