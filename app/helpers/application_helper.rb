module ApplicationHelper

  def full_title(page_title = "")
    base_title = "Gathers"
    base_title += " : #{page_title}" unless page_title.empty?
    base_title
  end
end
