class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.string :name
      t.string :code
      t.string :nlc
      t.float :latitude
      t.float :longitude
      t.string :group_station
      t.string :short_name

      t.timestamps null: false
    end
  end
end
