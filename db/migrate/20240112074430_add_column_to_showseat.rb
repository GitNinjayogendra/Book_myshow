class AddColumnToShowseat < ActiveRecord::Migration[7.0]
  def change
    add_column :show_seats, :status, :string
  end
end
