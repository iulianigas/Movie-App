require 'rails_helper'

RSpec.describe Movie, :type => :model do
  describe 'validations' do
    subject { build(:movie) }
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:release_date) }
    it { is_expected.to validate_presence_of(:genre) }
    it { is_expected.to validate_presence_of(:language) }
    it { is_expected.to validate_presence_of(:description) }
  end

  describe 'validate length of movie fields' do
    subject { build(:movie) }
    it { is_expected.to validate_length_of(:title).is_at_least(4) }
    it { is_expected.to validate_length_of(:genre).is_at_least(4) }
    it { is_expected.to validate_length_of(:language).is_at_least(4) }
    it { is_expected.to validate_length_of(:description).is_at_least(8) }
    it { is_expected.to validate_length_of(:release_date) }
  end

  describe 'empty invalid constructor values' do
    subject { build(:movie, title: nil ) }
    describe 'empty invalid fields' do
      it { expect(subject).to_not be_valid }
    end
  end

  describe '#title' do
    subject { build(:movie) }
    it { should allow_value('The Dark Side').for(:title)}
    it { should_not allow_value('The').for(:title)}
  end

  describe '#genre' do
    subject { build(:movie) }
    it { should allow_value('Action').for(:genre)}
    it { should_not allow_value('A').for(:genre)}
  end

  describe '#language' do
    subject { build(:movie) }
    it { should allow_value('English').for(:language)}
    it { should_not allow_value('ENG').for(:language)}
  end

  describe '#release_date' do
    subject { build(:movie) }
    it { should allow_value('01.02.2021').for(:release_date)}
    it { should allow_value('01/02/2021').for(:release_date)}
    it { should_not allow_value('asd').for(:release_date)}
  end

  describe '#description' do
    subject { build(:movie) }
    it { should allow_value('Lorem ipsum et doloremque.').for(:description)}
    it { should_not allow_value('Lorem').for(:description)}
  end

  describe 'validation presence of attributes' do
    it 'check presence of title validation messages' do
      movie = Movie.new
      movie.title = nil
      movie.validate
      expect(movie.errors[:title]).to include("can't be blank")
      expect(movie.errors[:title]).to include('is too short (minimum is 4 characters)')
    end
  
    it 'check presence of genre validation messages' do
      movie = Movie.new
      movie.genre = nil
      movie.validate
      expect(movie.errors[:genre]).to include("can't be blank")
      expect(movie.errors[:genre]).to include('is too short (minimum is 4 characters)')
    end

    it 'check presence of language validation messages' do
      movie = Movie.new
      movie.language = nil
      movie.validate
      expect(movie.errors[:language]).to include("can't be blank")
      expect(movie.errors[:language]).to include('is too short (minimum is 4 characters)')
    end
  
    it 'check presence of description validation messages' do
      movie = Movie.new
      movie.description = nil
      movie.validate
      expect(movie.errors[:description]).to include("can't be blank")
      expect(movie.errors[:description]).to include('is too short (minimum is 8 characters)')
    end
  
    it 'check presence of release_date validation messages' do
      movie = Movie.new
      movie.release_date = nil
      movie.validate
      expect(movie.errors[:release_date]).to include("can't be blank")
    end
  end
end