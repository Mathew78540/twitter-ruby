class RemoveLikesFromTweet < ActiveRecord::Migration
  def change
    remove_column :tweets, :likes, :integer
  end
end
