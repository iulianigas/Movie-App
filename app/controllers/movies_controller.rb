class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    if params[:category].blank?
      @movies = Movie.all
    else 
      @category_id = Category.find_by(name: params[:category]).id
      @movies = Movie.where(:category_id => @category_id)
    end
    @movies = Kaminari.paginate_array(@movies).page(params[:page]).per(10)
  end

  def search
      @movies = Movie.where("title LIKE ?","%" + params[:q] + "%")
  end

  def show
  end

  def new
    @movie = current_user.movies.build
    @categories = Category.all.map { |c| [ c.name, c.id ] }
  end

  def edit
    @categories = Category.all.map { |c| [ c.name, c.id ] }
  end

  def create
    @movie = current_user.movies.build(movie_params)
    @movie.category_id = params[:category_id]
    @categories = Category.all.map { |c| [ c.name, c.id ] }
    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: 'Movie has been created Successfully' }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @movie.category_id = params[:category_id]
    @categories = Category.all.map { |c| [ c.name, c.id ] }
    respond_to do |format|
      if @movie.update(movie_params)
        # binding.pry
        format.html { redirect_to @movie, notice: 'Movie has been updated Successfully' }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_url }
      format.json { head :no_content }
    end
  end

  private
    def set_movie
      @movie = Movie.find(params[:id])
    end

    def movie_params
      params.require(:movie).permit(:title, :release_date, :language, :genre, :description, :user_id, :category_id, :movie_image)
    end

    def find_movie
      @movie = Movie.find(params[:id])
    end
end