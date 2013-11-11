class Tweet < ActiveRecord::Base
  # Associated with tweets table in the db.
  attr_accessible :status
end
