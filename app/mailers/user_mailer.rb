class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def signup_confirmation(user)
    @user = user

    @greeting = "Thanks for signing up with TwitterClone!"

    mail to: user.email, subject: "Twitter Signup Confirmation"
  end
end
