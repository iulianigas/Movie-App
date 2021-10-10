class AddColumnLanguageToMovies < ActiveRecord::Migration[6.1]
  def change
    add_column :movies, :language, :string
  end
end
