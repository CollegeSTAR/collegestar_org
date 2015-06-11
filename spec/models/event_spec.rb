RSpec.describe Event, :type => :model do
  it "validates presence of name" do
    @event = build(:event, name: nil)
    @event.valid?
    expect(@event.errors[:name].size).to eq(1)
  end

  it "validates uniqueness of name" do
    @event = create(:event)
    @event_2 = build(:event, name: @event.name)
    @event_2.valid?
    expect(@event_2.errors[:name].size).to eq(1)
  end

  it "validates presence of slug" do
    @event = build(:event, slug: nil)
    @event.valid?
    expect(@event.errors[:slug].size).to eq(1)
  end

  it "validates uniqueness of slug" do
    @event = create(:event)
    @event_2 = build(:event, slug: nil)
    @event_2.valid?
    expect(@event_2.errors[:slug].size).to eq(1)
  end

  it "validates the presence of registration_open_datetime" do
    @event = build(:event, registration_open_datetime: nil)
    @event.valid?
    expect(@event.errors[:registration_open_datetime].size).to eq(1)
  end

  it "validates the presence of registration_close_datetime" do
    @event = build(:event, registration_close_datetime: nil)
    @event.valid?
    expect(@event.errors[:registration_close_datetime].size).to eq(1)
  end

  it "validates the presence of start_datetime" do
    @event = build(:event, start_datetime: nil)
    @event.valid?
    expect(@event.errors[:start_datetime].size).to eq(1)
  end

  it "validates the presence of end_datetime" do 
    @event = build(:event, end_datetime: nil)
    @event.valid?
    expect(@event.errors[:end_datetime].size).to eq(1)
  end

  it "validates the presence of address" do
    @event = build(:event, address: nil)
    @event.valid?
    expect(@event.errors[:address].size).to eq(1)
  end

  it "validates the presence of city" do
    @event = build(:event, city: nil)
    @event.valid?
    expect(@event.errors[:city].size).to eq(1)
  end

  it "validates the presence of state" do
    @event = build(:event , state: nil)
    @event.valid?
    expect(@event.errors[:state].size).to eq(1)
  end

  it "validates the state is an actual state"

  it "validates the presence of zip_code" do
    @event = build(:event, zip_code: nil)
    @event.valid?
    expect(@event.errors[:zip_code].size).to eq(1)
  end

  it "registration_close_datetime should be after registration_open_datetime"
  it "registration_open_datetime should be before start_datetime"
  it "end_datetime should be after start_datetime"
end
