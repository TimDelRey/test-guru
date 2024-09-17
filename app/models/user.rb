class User < ApplicationRecord

  has_many :created_tests, 
            class_name: 'Test', 
            foreign_key: 'user_id', 
            dependent: :nullify
  has_many :started_test, 
            class_name: 'StartedTest',
            foreign_key: 'user_id',
            dependent: :destroy
  has_many :tests, through: :started_test

  # def users_history_by_level(level)
  #   Test.joins('JOIN started_tests ON started_tests.test_id = tests.id')
  #     .where(started_tests: { user_id: id }, tests: { level: level })
  #     .pluck(:title)
  # end

  def tests_history_by_level (level)
    Test.joins(:started_tests)
      .where(started_tests: {user_id: self.id})
      .where('level = ?',level)     
      .pluck(:title)
  end
end
