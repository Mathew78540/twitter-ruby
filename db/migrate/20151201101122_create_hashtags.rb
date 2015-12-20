class CreateHashtags < ActiveRecord::Migration
  def change
    create_table :hashtags do |t|
      t.string :hashtag
      t.integer :count, :default => 1

      t.timestamps null: false
    end
  end
end
