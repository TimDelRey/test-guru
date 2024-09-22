class User < ApplicationRecord

  has_many :created_tests, 
            class_name: 'Test', 
            foreign_key: 'user_id'
  has_many :started_test
  has_many :tests, through: :started_test

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