class CreateKardmaExchanges < ActiveRecord::Migration
  def change
    create_table :kardma_exchanges do |t|

      t.timestamps null: false
    end
  end
end
