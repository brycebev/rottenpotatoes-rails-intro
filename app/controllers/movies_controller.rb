class MoviesController < ApplicationController

    def show
      id = params[:id] # retrieve movie ID from URI route
      @movie = Movie.find(id) # look up movie by unique ID
      # will render app/views/movies/show.<extension> by default
    end
  
    def index
      puts params[:home]
      if params[:home] == "1"
        puts "BALLS"
        session[:ratings] = params[:ratings]
        session[:sorted] = params[:sorted]
      end
      @all_ratings = Movie.all_ratings
      @movie_class = 'hilite'
      @release_date_class = 'hilite'
      if not session[:ratings].nil?
        @ratings_to_show = session[:ratings].keys
        @movies = Movie.with_ratings(@ratings_to_show)
      else
        @ratings_to_show = Movie.all_ratings
        @movies = Movie.all
      end
      
      
      # if session[:sorted] = params[:sorted]
      @sorted = session[:sorted]
      if @sorted == "title"
        @movies = @movies.sort_by { |movie| movie.title }
        @movie_class = "hilite p-3 mb-2 bg-warning text-dark"
      elsif @sorted == "date"
        @movies = @movies.sort_by { |movie| movie.release_date }
        @release_date_class = "hilite p-3 mb-2 bg-warning text-dark"
      end
    end
    
  
    def new
      # default: render 'new' template
    end
  
    def create
      @movie = Movie.create!(movie_params)
      flash[:notice] = "#{@movie.title} was successfully created."
      redirect_to movies_path
    end
  
    def edit
      @movie = Movie.find params[:id]
    end
  
    def update
      @movie = Movie.find params[:id]
      @movie.update_attributes!(movie_params)
      flash[:notice] = "#{@movie.title} was successfully updated."
      redirect_to movie_path(@movie)
    end
  
    def destroy
      @movie = Movie.find(params[:id])
      @movie.destroy
      flash[:notice] = "Movie '#{@movie.title}' deleted."
      redirect_to movies_path
    end
  
    private
    # Making "internal" methods private is not required, but is a common practice.
    # This helps make clear which methods respond to requests, and which ones do not.
    def movie_params
      params.require(:movie).permit(:title, :rating, :description, :release_date)
    end
  end