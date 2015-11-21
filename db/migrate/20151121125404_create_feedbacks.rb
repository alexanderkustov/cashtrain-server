class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.string :train_id
      t.float :feedback

      t.timestamps null: false
    end
  end
end
