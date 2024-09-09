class User < ApplicationRecord

  def users_history_by_level(level)
    Test.joins('JOIN started_tests ON started_tests.test_id = tests.id')
      .where(started_tests: { user_id: id }, tests: { level: level })
      .pluck(:title)
  end

  # def tests_history_by_level (level)
  #   Test.joins(:started_test)
  #     .where(started_test: {user_id: self.id})
  #     .where('level = ?',level)     
  #     .pluck(:title)
  # end
end