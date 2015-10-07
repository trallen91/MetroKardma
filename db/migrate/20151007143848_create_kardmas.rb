class CreateKardmas < ActiveRecord::Migration
  def change
    create_table :kardmas do |t|

      t.timestamps null: false
    end
  end
end
