class UserMailer < ApplicationMailer
  default from: Rails.application.secrets.username
  def welcome_email(user_id)
    @user = User.find(user_id)
    @url  = 'http://example.com/login'
    mail(to:  @user.email, subject: 'Welcome to My Awesome Site')
  end

  def user_ticket(seats_id,data,user_id)
    @seat = seats_id
    @data = data
    @user = User.find(user_id)
    @url = 'http://example.com/login'
    mail(to:  @user.email, subject: 'Welcome to My Awesome Site')
  end
end
