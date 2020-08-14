class AddColumnToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :author, :string, null: false
  end
end
