class CreateStartedTests < ActiveRecord::Migration[6.1]
  def change
    create_table :started_tests do |t|
      t.integer :user_id, null: false, foreign_key: true
      t.integer :test_id, null: false, foreign_key: true
      t.boolean :passed, default: false

      t.timestamps
    end
  end
end
