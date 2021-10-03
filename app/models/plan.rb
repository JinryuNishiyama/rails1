class Plan < ApplicationRecord
  validates :title, presence: true, length: {maximum: 20}
  validates :date, presence: true
  validates :starting_time, presence: true
end
