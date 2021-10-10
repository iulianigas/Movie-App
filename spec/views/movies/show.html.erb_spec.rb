require 'spec_helper'

describe 'movies/show.html.erb' do
  it 'displays movie details correctly' do
    assign(:movie, Movie.create())
  end
end