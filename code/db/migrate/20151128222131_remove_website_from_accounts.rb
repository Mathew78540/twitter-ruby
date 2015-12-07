class RemoveWebsiteFromAccounts < ActiveRecord::Migration
  def change
    remove_column :accounts, :website, :string
  end
end
