class CreateNearStations < ActiveRecord::Migration[5.2]
  def change
    create_table :near_stations do |t|
      t.string :line
      t.string :station_name
      t.integer :time_on_foot

      t.timestamps
    end
  end
end
