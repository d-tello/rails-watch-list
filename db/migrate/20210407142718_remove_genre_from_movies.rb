class RemoveGenreFromMovies < ActiveRecord::Migration[6.1]
  def change
    remove_column :movies, :genre, :integer
  end
end
