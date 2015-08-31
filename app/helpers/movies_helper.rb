module MoviesHelper
	def sortable(column, title)
	    title ||= column.titleize
		if (column == sort_column) 
			title = sort_direction == "asc" ? title+"<span class='glyphicon glyphicon-arrow-down'></span>".to_str : title+"<span class='glyphicon glyphicon-arrow-up'></span>"
		end
	    direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"
	    link_to raw(title), {:sort => column, :direction => direction}
  	end
end