class Review < ApplicationRecord
  belongs_to :movie
  belongs_to :user
  # filterrific(
  #   default_filter_params: { sorted_by: 'created_at_desc' },
  #   available_filters: [
  #     :sorted_by,
  #     :search_query,
  #     :with_rating,
  #     :with_created_at_gte
  #   ]
  # )
end
