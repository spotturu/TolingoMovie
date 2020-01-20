require 'rest-client'

class OmdbGateway
	def initialize
		@url = 'www.omdbapi.com' #Rails.application.secrets.omdb[:url]
		@token = 'adfcf64f' #Rails.application.secrets.omdb[:token]
		@default_search = 'super'
	end

	def get_url_with_token
		"#{@url}?apikey=#{@token}"
	end

	def get_movie_search_url(search, page)
		"#{get_url_with_token}&type=movie&s=#{search}&page=#{page}"
	end

	def get_recent_release_movies
		res = RestClient.get("#{get_url_with_token}&type=movie&y=#{Time.new.year}&s=#{@default_search}")
		return get_results(res.body) if res.code == 200
		nil
	end
	
	def get_the_series_sorted_by_year(search)
		total_series = get_all_the_series(search)
		sort_by_year = Hash.new
		total_series.each do |series|
			sort_by_year[series['year']] ||= Array.new
			sort_by_year[series['year']].push(series)
		end
		sort_by_year
	end

	def get_all_the_series(search)
	    page = 1
	    res = ''
	    results = Array.new
	    while page <= 3
			res = get_the_series_for(search, page)
			results.push(res) if res.present?
			page += 1
		end
		results.flatten
	end

	def get_the_series_for(search, page)
		res = RestClient.get("#{get_url_with_token}&type=movie&s=#{search}")
		return get_results(res.body) if res.code == 200
		nil
	end

	def get_results(response)
	   res = JSON.parse(response)
	   res["Search"]
	end
end