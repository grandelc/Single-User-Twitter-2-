class Tweet < ActiveRecord::Base
  # Associated with tweets table in the db.
  attr_accessible :status

  # Old Style
  validates :status, :length => { :maximum => 140, :minimum => 1 }

  # New Style
  # validates :status, length: => { maximum: 140, minimum: 1 }
end
