class User < ActiveRecord::Base
  has_secure_password

  validates :email, :presence => true, :uniqueness => true
  validates :userhandle, :presence => true, :uniqueness => true
  has_many :tweets

  after_create :send_welcome_message

  def send_welcome_message
    UserMailer.signup_confirmation(self).deliver
  end
end
