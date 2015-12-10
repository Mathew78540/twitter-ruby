class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.integer :account_id
      t.string :text, limit: 140
      t.integer :likes, :default => 0

      t.timestamps null: false
    end
  end
end
