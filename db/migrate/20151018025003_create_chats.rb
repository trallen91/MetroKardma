class CreateChats < ActiveRecord::Migration
  def change
    create_table :chats do |t|
      # t.belongs_to :swiper, null: false
      # t.belongs_to :swipee, null: false
      t.references :kardma_exchange, null: false
      #this might be deprecated later
      t.string :fireBaseId
      t.timestamps null: false
    end
  end
end
