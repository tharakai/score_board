class Game < ActiveRecord::Base
  attr_accessible :tournament_id, :game_number, :name, :scores_attributes, :spirit_score
  belongs_to :tournament
  has_many :scores, dependent: :destroy
  has_many :teams, :through => :scores
  
  accepts_nested_attributes_for :scores, allow_destroy: true
  validates_associated :scores
  #validate :cannot_play_each_other

  validates :name, presence: true

  def cannot_play_each_other
  	self.scores.map(&:team_id).uniq.length != self.scores.length
    errors.add :base, "Same team cannot play each other"
  end

end
