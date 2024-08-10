class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.text :body        #投稿本文  
      t.string :name      #商品名
      t.integer :price    #商品価格
      t.timestamps
    end
  end
end
