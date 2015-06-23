require 'spec_helper'

RSpec.describe State do
  describe "#all" do
    it "should return a hash with the abbreviation of state as the key and the state object as the value" do
      @states = State.all
      @states_expected = {
        "AL" => "Alabama",
        "AK" => "Alaska",
        "AZ" => "Arizona",         
        "AR" => "Arkansas",        
        "CA" => "California",      
        "CO" => "Colorado",
        "CT" => "Connecticut",    
        "DE" => "Delaware",
        "FL" => "Florida",      
        "GA" => "Georgia",
        "HI" => "Hawaii", 
        "ID" => "Idaho",
        "IL" => "Illinois",
        "IN" => "Indiana",
        "IA" => "Iowa",
        "KS" => "Kansas",
        "KY" => "Kentucky",
        "LA" => "Louisiana",
        "ME" => "Maine",
        "MD" => "Maryland",
        "MA" => "Massachusetts",
        "MI" => "Michigan",
        "MN" => "Minnesota",
        "MS" => "Mississippi",
        "MO" => "Missouri",
        "MT" => "Montana",
        "NE" => "Nebraska",
        "NV" => "Nevada",
        "NH" => "New Hampshire",
        "NJ" => "New Jersey",
        "NM" => "New Mexico",
        "NY" => "New York",
        "NC" => "North Carolina",
        "ND" => "North Dakota",
        "OH" => "Ohio",
        "OK" => "Oklahoma",
        "OR" => "Oregon",
        "PA" => "Pennsylvania",
        "RI" => "Rhode Island",
        "SC" => "South Carolina",
        "SD" => "South Dakota",
        "TN" => "Tennessee",
        "TX" => "Texas",
        "UT" => "Utah",
        "VT" => "Vermont",
        "VA" => "Virginia", 
        "WA" => "Washington",
        "WV" => "West Virginia",
        "WI" => "Wisconsin",
        "WY" => "Wyoming"
      }
      expect(@states).to eq(@states_expected)
    end
  end

  describe "#get_abbreviation" do
    it "should return an abbreviation for a given state name" do
      north_carolina_abbreviation = State.get_abbreviation "North Carolina"
      expect(north_carolina_abbreviation).to eq("NC")
    end

    it "should return an abbreviation for a given state name with lower case letters" do 
      north_carolina_abbreviation = State.get_abbreviation "north carolina"
      expect(north_carolina_abbreviation).to eq("NC")
    end

    it "should return false for an unknown state name" do
      fake_state_abbreviation = State.get_abbreviation "Fake State"
      expect(fake_state_abbreviation).to be_falsey
    end
  end

  describe "#get_name" do
    it "should return a state name for a given state abbreviation" do
      north_carolina_name = State.get_name "NC"
      expect(north_carolina_name).to eq("North Carolina")
    end

    it "should return a name for a given abbreviation with lower case letters" do 
      north_carolina_name = State.get_name "nc"
      expect(north_carolina_name).to eq("North Carolina")
    end

    it "should return false for an unknown state abbreviation" do
      fake_state_name = State.get_name "FS"
      expect(fake_state_name).to be_falsey
    end
  end
end
