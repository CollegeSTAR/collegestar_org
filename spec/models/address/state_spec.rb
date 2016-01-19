require 'spec_helper'

RSpec.describe Address::State do
  let(:address) { Class.new { extend Address::State  } }
  let(:states_expected) { 
    {
      "Alabama" => "AL",
      "Alaska" => "AK",
      "Arizona" => "AZ",         
      "Arkansas" => "AR",        
      "California" => "CA",      
      "Colorado" => "CO",
      "Connecticut" => "CT",    
      "Delaware" => "DE",
      "Florida" => "FL",      
      "Georgia" => "GA",
      "Hawaii" => "HI", 
      "Idaho" => "ID",
      "Illinois" => "IL",
      "Indiana" => "IN",
      "Iowa" => "IA",
      "Kansas" => "KS",
      "Kentucky" => "KY",
      "Louisiana" => "LA",
      "Maine" => "ME",
      "Maryland" => "MD",
      "Massachusetts" => "MA",
      "Michigan" => "MI",
      "Minnesota" => "MN",
      "Mississippi" => "MS",
      "Missouri" => "MO",
      "Montana" => "MT",
      "Nebraska" => "NE",
      "Nevada" => "NV",
      "New Hampshire" => "NH",
      "New Jersey" => "NJ",
      "New Mexico" => "NM",
      "New York" => "NY",
      "North Carolina" => "NC",
      "North Dakota" => "ND",
      "Ohio" => "OH",
      "Oklahoma" => "OK",
      "Oregon" => "OR",
      "Pennsylvania" => "PA",
      "Rhode Island" => "RI",
      "South Carolina" => "SC",
      "South Dakota" => "SD",
      "Tennessee" => "TN",
      "Texas" => "TX",
      "Utah" => "UT",
      "Vermont" => "VT",
      "Virginia" => "VA", 
      "Washington" => "WA",
      "West Virginia" => "WV",
      "Wisconsin" => "WI",
      "Wyoming" => "WY"
   }
 }
  describe "#all" do
    it "should return a hash with the abbreviation of state as the key and the state object as the value" do
      expect(address.get_states).to match_array(states_expected)
    end
  end
  describe "#get_abbreviation" do
    it "should return an abbreviation for a given state name" do
      north_carolina_abbreviation = address.get_state_abbreviation "North Carolina"
      expect(north_carolina_abbreviation).to eq("NC")
    end

    it "should return an abbreviation for a given state name with lower case letters" do 
      north_carolina_abbreviation = address.get_state_abbreviation "north carolina"
      expect(north_carolina_abbreviation).to eq("NC")
    end

    it "should return false for an unknown state name" do
      fake_state_abbreviation = address.get_state_abbreviation "Fake State"
      expect(fake_state_abbreviation).to be_falsey
    end
  end
    describe "#valid?" do
      it "should return true if state name is found" do
        expect(address.state_valid? name: "North Carolina").to be_truthy
      end
      it "should return true if state abbreviation is found" do
        expect(address.state_valid? abbreviation: "NC").to be_truthy
      end
      it "should return true if state abbreviation and name are found" do
        expect(address.state_valid? abbreviation: "NC", name: "North Carolina").to be_truthy
      end
      it "should return false if state name is not found" do
        expect(address.state_valid? name: "Not a State").to be_falsey
      end
      it "should return false if state abbreviation is not found" do
        expect(address.state_valid? abbreviation: "Not an abbreviation").to be_falsey
      end
      it "should return false if state name is correct, but abbreviation is incorrect" do
        expect(address.state_valid? abbreviation: "Not an abbreviation", name: "North Carolina").to be_falsey
      end      
      it "should return false if state name is incorrect, but abbreviation is correct" do
        expect(address.state_valid? abbreviation: "NC", name: "Not a state").to be_falsey
      end
    end

  describe "#get_name" do
    it "should return a state name for a given state abbreviation" do
      north_carolina_name = address.get_state_name "NC"
      expect(north_carolina_name).to eq("North Carolina")
    end

    it "should return a name for a given abbreviation with lower case letters" do 
      north_carolina_name = address.get_state_name "nc"
      expect(north_carolina_name).to eq("North Carolina")
    end

    it "should return false for an unknown state abbreviation" do
      fake_state_name = address.get_state_name "FS"
      expect(fake_state_name).to be_falsey
    end
  end
end
