class CreateReports < ActiveRecord::Migration[6.0]
  def change
    create_table :reports do |t|
      t.string :title, null: false
      t.date :date
      t.integer :study_time
      t.string :body
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
