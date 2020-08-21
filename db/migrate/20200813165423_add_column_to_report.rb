class AddColumnToReport < ActiveRecord::Migration[6.0]
  def change
    add_column :reports, :author, :string, null: false
  end
end
