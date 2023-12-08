class CreateSeats < ActiveRecord::Migration[7.0]
  def change
    create_table :seats do |t|
      t.integer :seatnumber
      t.string :status
      t.belongs_to :cinema , foreign_key: true
      t.timestamps
    end
  end
end
