class CreateShowSeats < ActiveRecord::Migration[7.0]
  def change
    create_table :show_seats do |t|
      t.belongs_to :seat, foreign_key: true, array: true, default: []
      t.belongs_to :showtime , foreign_key: true
      t.belongs_to :movie , foreign_key: true
      t.belongs_to :cinema , foreign_key: true
      t.timestamps
    end
  end
end
