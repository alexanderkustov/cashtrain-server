class AddTrainIdToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :train_id, :string
  end
end
