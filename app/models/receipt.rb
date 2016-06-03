class Receipt < ActiveRecord::Base
  validates :title, presence: true
  validates :date, presence: true
  validates :amount, numericality: true
end
