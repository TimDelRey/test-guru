class Test < ApplicationRecord

  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_many :questions
  has_many :started_tests
  has_many :users, through: :started_tests

  def self.desc_tests_by_category (name_category)
    select(:title, :updated_at)
      .order(updated_at: :desc)
      .joins(:category)
      .where(category: { title: name_category })
      .pluck(:title)
  end
end