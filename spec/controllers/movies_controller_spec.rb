require 'rails_helper'
require 'pry'

RSpec.describe MoviesController, type: :controller do
  
  before do
    sign_in FactoryBot.create(:user)
  end

  describe "GET #index " do
    before do
      get :index
    end

    it "returns http status 200" do
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #new" do
    before do
      get :new
    end

    it "returns http status 200" do
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #search" do
    it "returns http status 200" do
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #show" do
    it "returns http status 200" do
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #edit" do
    it "returns http status 200" do
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #update" do
    it "returns http status 200" do
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #create" do
    it "returns http status 200" do
      expect(response).to have_http_status(200)
    end
  end

  describe "POST #create" do
    it "returns http status 200" do
      expect(response).to have_http_status(200)
    end
  end
  
  describe "GET #show" do
    let(:movie) {create(:movie)}

    it "shows the movie" do
      get :show, params: { id: movie.id }
      expect(response).to have_http_status(200)
    end
  end

  describe 'show is invalid' do
    it 'movie not found' do
      expect { get :show, params: { id: 'fail'} }.to raise_exception(ActiveRecord::RecordNotFound)
    end
  end

  describe '#update' do
    it 'updates a movie' do
      movie = create(:movie)
      patch :update, params: { id: movie.id, movie: {language: 'english'} }
      expect(movie.reload.language).to eq 'english'
    end

    it 'apply factory bot update on a movie title' do
      movie = create(:movie)
      patch :update, params: { id: movie.id, movie: {title: 'Joker'} }
      expect(movie.reload.title).to_not eq 'Joker'
    end
  end

  describe "deletes the movie" do
    it 'deletes the movie in first way' do
      movie = create(:movie)
      expect { delete :destroy , params: { id: movie.id } }.to change { Movie.count }.by(-1)
    end

    it 'deletes the movie in a second way' do
      movie = create(:movie)
      delete :destroy , params: { id: movie.id }
      expect(response.status).to eq(302)
    end
  end
end