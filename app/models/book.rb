class Book < ApplicationRecord
  # TODO: add validations on user_name

  def is_claimed?
    user_name.present?
  end
end
