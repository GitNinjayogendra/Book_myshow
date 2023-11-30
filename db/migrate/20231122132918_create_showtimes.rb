class CreateShowtimes < ActiveRecord::Migration[7.0]
  def change
    create_table :showtimes do |t|
      t.datetime :startime
      t.belongs_to :movie , foreign_key: true

      t.timestamps
    end
  end
end
