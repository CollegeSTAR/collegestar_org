require 'spec_helper'

RSpec.describe NullCampusDirector do
  
  subject { described_class.new }
  it "returns default text for first_name" do
    expect( subject.first_name ).to_not be_nil 
  end
  it "returns default text for last_name" do
    expect( subject.last_name ).to_not be_nil
  end
  it "returns default text for full_name" do
    expect( subject.full_name ).to_not be_nil
  end
  it "returns default text for email" do
    expect( subject.email ).to_not be_nil
  end

  it "responds to address_1" do
    expect( subject ).to respond_to(:address_1)
  end
  it "responds to address_2" do
    expect( subject ).to respond_to(:address_2)
  end
  it "responds to city" do
    expect( subject ).to respond_to(:city)
  end
  it "responds to state" do
    expect( subject ).to respond_to(:state)
  end
  it "responds to zip" do
    expect( subject ).to respond_to(:zip)
  end
  it "responds to phone_number" do
    expect( subject ).to respond_to(:phone_number)
  end
end
