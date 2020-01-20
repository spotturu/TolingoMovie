class ListMoviesController < ApplicationController

  before_action :set_movie

  # GET /list_movies
  def index
    @list_movies = if params[:search].present? 
                     @movies.get_the_series_sorted_by_year(params[:search])
                   else 
                     @movies.get_recent_release_movies 
                   end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movies = OmdbGateway.new
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def list_movie_params
      params.fetch(:list_movie, :search)
    end
end