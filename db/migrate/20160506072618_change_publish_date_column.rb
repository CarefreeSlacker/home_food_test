class ChangePublishDateColumn < ActiveRecord::Migration
  def change
  	change_column :posts, :publish_date, :datetime
  	rename_column :posts, :publish_date, :publish_time
  end
end
