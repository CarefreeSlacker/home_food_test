class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name
      t.text :text
      t.string :published_state
      t.date :publish_date
      t.timestamps null: false
    end
  end
end
