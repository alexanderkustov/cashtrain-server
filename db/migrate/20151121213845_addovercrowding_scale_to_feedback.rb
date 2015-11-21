class AddovercrowdingScaleToFeedback < ActiveRecord::Migration
  def change
    add_column :feedbacks, :overcrowdingScale, :float
    remove_column :feedbacks, :feedback
  end
end
