module ApplicationHelper
  def html_tag(attrs={})
    attrs.symbolize_keys!
    html = ""
    html << "<!--[if lt IE 7]> #{ tag(:html, class: "lt-ie9 lt-ie8 lt-ie7 #{attrs}") } <![endif]-->\n"
    html << "<!--[if IE 7]>    #{ tag(:html, class: "lt-ie9 lt-ie8 #{attrs}") } <![endif]-->\n"
    html << "<!--[if IE 8]>    #{ tag(:html, class: "lt-ie9 #{attrs}") } <![endif]-->\n"
    html << "<!--[if gt IE 8]><!--> "

    if block_given? && defined? Haml
      haml_concat(html.html_safe)
      haml_tag :html, attrs do
        haml_concat("<!--<![endif]-->".html_safe)
        yield
      end
    else
      html = html.html_safe
      html << tag(:html, attrs, true)
      html << " <!--<![endif]-->\n".html_safe
      html
    end
  end
end
