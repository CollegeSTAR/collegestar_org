class NullPage < Page
  def initialize( params = {} )
    super(params)
    self.title = "No Content"
    self.slug = "no-content"
    self.text = "This section does not have any content and/or could not be found."
  end
end
