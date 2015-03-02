module ApplicationHelper
  def get_title(title)
    title ||= ""
    title = title.length > 0 ? title + " | College STAR" : "College STAR"
  end
end
