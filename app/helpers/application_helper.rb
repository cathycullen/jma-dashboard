module ApplicationHelper
  def sortable column, title=nil
    title ||= column.titleize
    direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"
    css_class = (column == sort_column) ? "current #{sort_direction}" : nil

    if column != sort_column
      css_class = nil
    elsif sort_direction == "asc"
      css_class = "glyphicon glyphicon-triangle-top"
    else
      css_class = "glyphicon glyphicon-triangle-bottom"
    end
    #link_to title, {:sort => column, :direction => direction}, {:class => css_class}
    link_to "#{title} <span class='#{css_class}'></span>".html_safe, params.merge(:sort => column, :direction => direction, :page => nil)
  end
end
