class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :username
      t.string :password
      t.string :description
      t.string :website
      t.string :theme_color
      t.string :firstname
      t.string :lastname

      t.timestamps null: false
    end
  end
end
