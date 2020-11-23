class Account < ApplicationRecord
  belongs_to :user

  validates :balance, numericality: {greater_than_or_equal_to: 25, messages: "you broke need more than $25 yo"}

  validates :name, presence: true
end
