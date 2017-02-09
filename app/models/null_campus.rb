class NullCampus < Campus
  
  def initialize( params = {} )
    super(params)
    self.name = "Other"
    self.abbreviation = "N/A"
    self.institution_type = "N/A"
    self.website_url = "N/A"
    self.address_1 = "N/A"
    self.address_2 = "N/A"
    self.city = "N/A"
    self.state = "N/A"
    self.zip = "N/A"
    self.slug = ""
  end

  def to_param
    slug
  end

end
