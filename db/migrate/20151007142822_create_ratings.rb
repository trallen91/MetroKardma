class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.references :rater
      t.references :rated_user
      t.string :comment, null: false
      t.integer :score, null: false

      t.timestamps null: false
    end
  end
end
