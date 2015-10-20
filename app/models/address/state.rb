module Address::State

  @@states = {
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

  def get_states(args = {})
    return @@states
  end

  def get_state_abbreviation(name)
    @@states.each do |state_name, abbrev|
      return abbrev if state_name.downcase == name.downcase
    end
    false
  end

  def get_state_name(abbreviation)
    @@states.each do |state_name, abbrev|
      return state_name if abbrev.downcase == abbreviation.downcase
    end
    false
  end

  def state_valid?(args = {})
    valid_name, valid_abbr, valid = false, false, false
    name = args.fetch(:name, false)
    abbr = args.fetch(:abbreviation, false)
    if name
      valid_name = true if @@states.has_key? name
    end
    if abbr
      valid_abbr = true if @@states.has_value? abbr
    end
    valid = true if valid_name && valid_abbr
    valid = true if valid_name && !abbr
    valid = true if valid_abbr && !name
    valid
  end
end
