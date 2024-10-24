class Book < ApplicationRecord
  # TODO: add validations on user_name

  def is_claimed?
    user_name.present?
  end

  def is_claimed_by?(name)
    name == user_name
  end
end
