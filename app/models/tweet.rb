class Tweet < ActiveRecord::Base
  belongs_to :twitteruser
  # Remember to create a migration!
end
