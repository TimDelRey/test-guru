class Test < ApplicationRecord

  belongs_to :category

  def self.desc_tests_by_category (name_category)
    necessary_part_of_tests = Test.select(:id, :title, :updated_at).order(updated_at: :desc)
    necessary_part_of_tests.joins(:category).where(category: { title: name_category }).pluck(:title)
  end
end
