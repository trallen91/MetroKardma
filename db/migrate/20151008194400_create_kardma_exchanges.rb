class CreateKardmaExchanges < ActiveRecord::Migration
  def change
    create_table :kardma_exchanges do |t|
      t.references :swiper
      t.references :swipee
      t.references :station
      t.boolean :complete, default: false

      t.timestamps null: false
    end
  end
end
