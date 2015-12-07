class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.integer :account_id
      t.integer :account_following_id

      t.timestamps null: false
    end
  end
end
