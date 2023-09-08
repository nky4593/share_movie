class MoviesController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def new
    @movie = current_user.movies.build
  end

  def create
    @movie = current_user.movies.build(movie_params)

    begin
      ActiveRecord::Base.transaction do
        movie_info = VideoInfo.new(params[:movie][:movie_url])

        @movie.title = movie_info.title
        @movie.description = movie_info.description
        @movie.thumbnail_small = movie_info.thumbnail_small
        @movie.thumbnail_medium = movie_info.thumbnail_medium
        @movie.thumbnail_large = movie_info.thumbnail_large
        @movie.embed_url = movie_info.embed_url

        if @movie.save
          redirect_to root_path, notice: "Movie was shared."
        end
      end
    rescue StandardError => e
      render :new
    end
    
  end

  private

  def movie_params
    params.require(:movie).permit :movie_url, :user_id
  end
end
