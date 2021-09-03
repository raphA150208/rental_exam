class AddEstateRefToNearStations < ActiveRecord::Migration[5.2]
  def change
    add_reference :near_stations, :estate, foreign_key: true
  end
end
