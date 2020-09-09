class Book < ApplicationRecord
  validates :title, presence: true
  validates :author, presence: true
  validates :isbn, presence: true
  has_many :copies
end
