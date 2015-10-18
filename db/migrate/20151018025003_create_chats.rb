class CreateChats < ActiveRecord::Migration
  def change
    create_table :chats do |t|
      t.references :swiper, null: false
      t.references :swipee, null: false
      t.string :fireBaseId, null: false
      t.timestamps null: false
    end
  end
end
