class UserMailer < ApplicationMailer
  def account_activation user
    @user = user
    mail to: user.email, subject: "HomeStay account activation"
  end
end
