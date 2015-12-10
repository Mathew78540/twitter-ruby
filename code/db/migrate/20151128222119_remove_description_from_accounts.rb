class RemoveDescriptionFromAccounts < ActiveRecord::Migration
  def change
    remove_column :accounts, :description, :string
  end
end
