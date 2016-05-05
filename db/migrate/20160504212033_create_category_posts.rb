class CreateCategoryPosts < ActiveRecord::Migration
  def change
    create_table :category_posts do |t|
      t.integer :category_id
      t.integer :post_id
      t.timestamps null: false
    end
  end
end
