class JudgeRegistration < ActiveRecord::Base
  attr_accessible :division
  belongs_to :judge
  belongs_to :tournament
  
  validates :division, :presence => true


  def self.create_judge_registration(user,tourney,division)
    @jr = create! do |jr|
      jr.judge = Judge.where(user_id: user.id).first
      jr.tournament = tourney
      jr.division = division
    end
    @jr
  end
    
end