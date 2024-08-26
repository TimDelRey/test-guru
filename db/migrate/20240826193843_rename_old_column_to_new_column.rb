class RenameOldColumnToNewColumn < ActiveRecord::Migration[6.1]
  def change
    rename_column :answers, :test_id, :question_id
  end
end
