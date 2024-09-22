class Test < ApplicationRecord

  belongs_to :category
  belongs_to :author, 
              class_name: 'User', 
              foreign_key: 'user_id'
              
  has_many :questions, 
            dependent: :nullify
  has_many :started_tests,
            class_name: 'StartedTest',
            foreign_key: 'test_id',
            dependent: :destroy
  has_many :users, through: :started_tests, 
            dependent: :nullify

  def self.desc_tests_by_category (name_category)
    select(:title, :updated_at)
      .order(updated_at: :desc)
      .joins(:category)
      .where(category: { title: name_category })
      .pluck(:title)
  end
end
