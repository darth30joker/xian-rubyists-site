# encoding: UTF-8
module ApplicationHelper
  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = '西安Rubyist社区'
    page_title.empty? ? base_title : "#{base_title} | #{page_title}"
  end
end
