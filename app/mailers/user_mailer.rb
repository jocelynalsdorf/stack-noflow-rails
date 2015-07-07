class UserMailer < ApplicationMailer

  def signup_confirmation(user)
    @greeting = "Hi, Thanks for signing up"
    @user = user
    mail to: @user.email, subject: "Signup Confirmation"
  end
end
