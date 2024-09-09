class CreateStartedTests < ActiveRecord::Migration[6.1]
  def change
    create_table :started_tests do |t|
      t.string :status
      t.references :user, foreign_key: true, null: false
      t.references :test, foreign_key: true, null: false

      t.timestamps
    end
  end
end
