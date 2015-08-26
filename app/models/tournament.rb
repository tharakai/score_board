class Tournament < ActiveRecord::Base
  attr_accessible :date_from, :date_to, :description, :name, :venue
  has_many :teams, dependent: :destroy
  has_many :games, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :description, length: {maximum: 120}
  validates :date_from, presence: true
  validates :date_to, presence: true
  validates :venue, presence: true
  validate :validate_date_from_before_date_to
  default_scope order: 'date_from'

  def validate_date_from_before_date_to
    if date_from && date_to
      errors.add(:date_to, "should be greater than or equal to From date") if date_to < date_from
    end
  end
end
