class AddColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string, limit: 20
    add_column :users, :postal_code, :integer, limit: 7
    add_column :users, :address, :string
    add_column :users, :introduction, :string, limit: 120
  end
end
