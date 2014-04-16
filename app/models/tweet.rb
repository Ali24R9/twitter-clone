class Tweet < ActiveRecord::Base
  belongs_to :user

  def send_notification(user, tweet)
    UserMailer.tagged(user, tweet).deliver
  end

  def match_tag
    handle = self.tweet.scan(/@([a-z0-9_]+)/)
    new_handle = handle.join
    @searched = User.find_by(userhandle: new_handle)

    if @searched != nil
      send_notification(@searched, self)
    end
  end

end
