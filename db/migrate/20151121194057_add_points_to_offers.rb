class AddPointsToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :points, :integer
  end
end
