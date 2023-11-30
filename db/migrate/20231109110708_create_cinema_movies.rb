class CreateCinemaMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :cinema_movies do |t|
      t.belongs_to :cinema , foreign_key: true
      t.belongs_to :movie ,  foreign_key: true

      t.timestamps
    end
  end
end
