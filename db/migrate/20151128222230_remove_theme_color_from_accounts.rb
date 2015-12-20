class RemoveThemeColorFromAccounts < ActiveRecord::Migration
  def change
    remove_column :accounts, :theme_color, :string
  end
end
