class Movie < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :category, optional: true
  has_many :reviews
  has_one_attached :movie_image
  validates :user_id, presence: true
  validates :title, presence: true, length: { minimum: 4 }
  validates :category_id, presence: true
  validates :release_date, presence: true
  validates :genre, presence: true, length: { minimum: 4 }
  validates :language, presence: true, length: { minimum: 4 }
  validates :description, presence: true, length: { minimum: 8 }
  after_commit :add_default_image, on: %i[create update]
  Movie.new.movie_image.attached? 
  
  def add_default_image
    unless movie_image.attached?
      movie_image.attach(
        io: File.open(Rails.root.join('app', 'assets', 'images', 'happy.jpg')),
        filename: 'happy.jpg', content_type: 'image/jpg'
      )
    end
  end
end