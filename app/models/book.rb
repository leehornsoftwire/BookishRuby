class Book < ApplicationRecord
  validates :title, presence: true
  validates :author, presence: true
  validates :isbn, presence: true, format: {with: /\A\d{9}[\d|X]\Z/, message: "Needs to be valid ISBN 10"}
  has_many :copies, dependent: :destroy
end
