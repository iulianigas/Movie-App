class SiteController < ApplicationController
  def index
    @movies = Movie.all
  end
end
