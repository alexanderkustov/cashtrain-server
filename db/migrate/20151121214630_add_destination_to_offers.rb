class AddDestinationToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :destination, :string
  end
end
