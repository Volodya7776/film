class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
    @comments = Comment.where(movie_id: params[:id])
  end

  def new
    @movie = Movie.new
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.new(movie_params.merge(user_id: current_user.id))
    if @movie.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      redirect_to movie_path(@movie)
    else
      render :edit
    end
  end

  def destroy
    Movie.find(params[:id]).destroy
    redirect_to root_path
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :description, :runtime, :released, :genre, :actors, :director,
                                  :imdb_rating, :image)
  end
end
