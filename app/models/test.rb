class Test < ApplicationRecord

  belongs_to :category

  def self.desc_tests_by_category (name_category)
    select(:title, :updated_at)
      .order(updated_at: :desc)
      .joins(:category)
      .where(category: { title: name_category })
      .pluck(:title)
  end
end