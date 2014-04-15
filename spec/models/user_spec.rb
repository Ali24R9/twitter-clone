require 'spec_helper'


describe User do

  it { should have_secure_password}
  it { should validate_presence_of :email }
  it { should validate_uniqueness_of :email }
  it { should validate_presence_of :userhandle }
  it { should validate_uniqueness_of :userhandle }
  it { should have_many :tweets }

  it 'send an email to welcome users' do
    user = User.new({email: 'test1@example.com', userhandle: 'test1', password: '1', password_confirmation: '1'})
    expect(UserMailer).to receive(:signup_confirmation).with(user)
    user.save
  end

end
