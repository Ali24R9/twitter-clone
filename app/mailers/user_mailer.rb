class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def signup_confirmation(user)
    @user = user

    @greeting = "Thanks for signing up with TwitterClone!"

    mail to: user.email, subject: "Twitter Signup Confirmation"
  end

  def tagged(user, tweet)
    # @user = user

    @greeting = "You were mentioned in a tweet"

    mail to: user.email, subject: "somebody tweeted you"
  end
end
