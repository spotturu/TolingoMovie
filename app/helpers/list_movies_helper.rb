require 'uri'
module ListMoviesHelper

	def show_table_records(list_movies)
		form = render partial: 'form'
		content_tag(:th, )
	end

	def list_all_movies(list_movies)
	  rows = ''
	  return content_tag(:h4, 'OOPS! No Movies found') if list_movies.blank?
	  list_movies.each do |movie|
	  	record = content_tag(:td, get_image(movie['Poster']))
	  	msg = content_tag(:td, get_img_content(movie))
	  	rows += content_tag(:tr, record + msg)
	  end
	  content_tag(:tbody, rows.html_safe)
	end

	def get_image(poster)
		url = "default.png"
		url = poster if poster =~ URI::regexp
		image_tag(url, data: { title: 'Railsation' }) 
	end

	def get_img_content(movie)
		 content_tag(:h3, movie['Title'], class:'red')
	end
end
