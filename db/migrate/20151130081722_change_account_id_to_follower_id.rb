class ChangeAccountIdToFollowerId < ActiveRecord::Migration
  def change
    rename_column :follows, :account_id, :follower_id
    rename_column :follows, :account_following_id, :account_id
  end
end
