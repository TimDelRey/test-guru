class AddDefaultLevelToTests < ActiveRecord::Migration[6.1]
  def change
    change_column :tests, :level, :string, default: 0
  end
end
