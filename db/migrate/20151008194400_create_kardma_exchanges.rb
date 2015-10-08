class CreateKardmaExchanges < ActiveRecord::Migration
  def change
    create_table :kardma_exchanges do |t|
      t.references :giver
      t.references :receiver
      t.references :station
      t.boolean :complete, default: false

      t.timestamps null: false
    end
  end
end
