class Tournament < ActiveRecord::Base
  attr_accessible :date_from, :date_to, :description, :name, :venue

  validates :name, presence: true, uniqueness: true
  validates :description, length: {maximum: 120}
  validates :date_from, presence: true
  validates :date_to, presence: true
end
