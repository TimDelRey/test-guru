class AddTablesAnswersQuestionsTestsNullConstaint < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:answers, :question_id, false)
    change_column_null(:questions, :body, false)
    change_column_null(:tests, :title, false)
  end
end
