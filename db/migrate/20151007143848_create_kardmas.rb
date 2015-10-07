class CreateKardmas < ActiveRecord::Migration
  def change
    create_table :kardmas do |t|
      t.references :giver
      t.references :receiver
      t.boolean :active, default: true
      t.timestamps null: false
    end
  end
end
