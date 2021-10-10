class Category < ApplicationRecord
  attr_accessor :category_id
  has_many :movies
end
