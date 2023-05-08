class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :description
      t.integer :runtime
      t.date :released
      t.string :genre
      t.string :actors
      t.string :director
      t.float :imdb_rating
      t.references :user

      t.timestamps
    end
  end
end
