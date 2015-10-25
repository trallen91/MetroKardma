class CreateChats < ActiveRecord::Migration
  def change
    create_table :chats do |t|
      t.belongs_to :swiper, null: false
      t.belongs_to :swipee, null: false
      #this might be deprecated later
      t.string :fireBaseId
      t.timestamps null: false
    end

    add_index :chats, :swiper
    add_index :chats, :swipee
  end
end
