class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.references :user, foreign_key: true
      t.string :movie_url
      t.string :title
      t.string :description
      t.string :thumbnail_small
      t.string :thumbnail_medium
      t.string :thumbnail_large
      t.string :embed_url

      t.timestamps
    end
  end
end
