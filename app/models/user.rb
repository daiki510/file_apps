class User < ApplicationRecord
  extend Enumerize

  validates :name, presence: true, length: {maximum: 30}
  validates :age, presence: true, numericality: { only_integer: true, greater_than_or_equal_to:0 ,less_than: 150 }
  enumerize :gender, in: [:male, :female]
end
