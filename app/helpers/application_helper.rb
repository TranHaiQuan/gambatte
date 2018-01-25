module ApplicationHelper
  def full_title page_title = ""
    base_title = "Gambatte Blog"
    page_title.empty? ? base_title : page_title + " | " + base_title
  end
end
