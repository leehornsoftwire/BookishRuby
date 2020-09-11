class Copy < ApplicationRecord
  belongs_to :book
  belongs_to :user, required: false
  #todo: validate date
end
