class AddColumnToShowseat < ActiveRecord::Migration[7.0]
  def change
    add_column :show_seats, :status, :string
    add_column :show_seats, :price,  :float
  end
end
