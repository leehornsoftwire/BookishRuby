class Copy < ApplicationRecord
  belongs_to :book
  validates :borrower, presence: true
  validates :due_date, presence: true
end
