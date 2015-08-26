class Score < ActiveRecord::Base
  attr_accessible :game_id, :msp, :mvp_female, :mvp_male, :score, :spirit_score, :team_id, :rules, :fouls, :positivity, :fairness, :communication
  belongs_to :team
  belongs_to :game
  
  store :spirit_score, accessors: [:rules, :fouls, :positivity, :fairness, :communication]

  scope :by_team, ->(id) { where("team_id = ?", id)}

  validates_uniqueness_of :team_id, :scope => [:game_id] #may not be needed cause custom method is defined. Check.
  validates :score, presence: true
  validates :spirit_score, presence: true

  SPIRIT_CATEGORIES = [:rules, :fouls, :positivity, :fairness, :communication]
  SPIRIT_CATEGORIES.each do |cat|
    validates cat, presence: true, :inclusion => 1..5
  end

  #spirit_score_total is not accessible but has to be calculated
end
