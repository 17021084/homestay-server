class UserMailer < ApplicationMailer
  def account_activation user
    @user = user
    mail to: user.email, subject: "HomeStay account activation"
  end
  def password_reset user
    @user = user
    mail to: user.email, subject: "HomeStay account reset password"
  end
end
