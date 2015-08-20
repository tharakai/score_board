class Team < ActiveRecord::Base
  attr_accessible :captain_name, :city, :contact_1, :contact_2, :email_1, :email_2, :name, :spirit_captain_name, :tournament_id
  belongs_to :tournament

  validates :name, presence: true
  validates_uniqueness_of :name, :scope => :tournament_id
  validates :captain_name, presence: true
  validates :spirit_captain_name, presence: true
  validates :city, presence: true
  validates :contact_1, presence: true, :numericality => true, :length => { :minimum => 10, :maximum => 12 }
  validates :email_1, presence: true

  default_scope order: 'name'

end
