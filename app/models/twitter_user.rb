class TwitterUser < ActiveRecord::Base
  has_many :tweets, dependent: :destroy
end

public
def updated?
  if self.tweets.first.body != CLIENT.get_all_tweets(self.name).first.text
    return false
  else
    return true
  end
end
