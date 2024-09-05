class User < ApplicationRecord
  def level_show_test (level)
    Test.where("level = ?", level).select (:title)
  end
end
