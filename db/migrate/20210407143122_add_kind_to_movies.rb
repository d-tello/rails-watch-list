class AddKindToMovies < ActiveRecord::Migration[6.1]
  def change
    add_column :movies, :genre, :string
  end
end
