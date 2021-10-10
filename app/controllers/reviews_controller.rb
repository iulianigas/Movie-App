class ReviewsController < ApplicationController
  before_action :find_movie

  def index 
    # @filterrific = Filterrific.new(Review, params[:filterrific])
    # @filterrific.select_options = {
    #   sorted_by: Review.options_for_sorted_by,
    # }
    # @reviews = Review.filterrific_find(@filterrific).page(params[:page])
    # respond_to do |format|
    #   format.html
    #   format.js
    # end
    # @review = Review.new
    # if params[:rating].present?
    #   @reviews = Review.where(status: params[:rating])
    
    # else
    #   @reviews = Review.includes(:user).order(created_at: :desc)
    # end 
    # if params[:category].blank?
    #   @reviews = Review.all
    # else 
    #   @category_id = Category.find_by(name: params[:category]).id
    #   @movie_id = Movie.find_by(name: params[:movie]).id
    #   @reviews = Review.where(:category_id => @category_id)
    # end
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.movie_id = @movie.id
    @review.user_id = current_user.id

    if @review.save 
      redirect_to movie_path(@movie)
    else
      render 'new'
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update 
    @review = Review.find(params[:id])
    
    if @review.update(review_params)
      redirect_to movie_path(@movie)
    else
      render 'edit'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to movie_path(@movie)
  end
  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end

  def find_movie
    @movie = Movie.find(params[:movie_id])
  end

end
