class User < ApplicationRecord
  
  belongs_to :category
  has_many :started_test

  def users_history_by_level (level)
    Test.joins(:started_test)
      .where(started_test: {user_id: self.id})
      .where('level = ?',level)     
      .pluck(:title)
  end
end