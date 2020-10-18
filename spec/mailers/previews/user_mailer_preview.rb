# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3030/rails/mailers/user_mailer/account_activation
  def account_activation

  trung = User.create(
    full_name: "Quang Trung",
    email: "trung@gmail.com",
    password: "123456",
    phone_number: "0977860496",
    is_host: 1,
    city_id: rand(1..3),
    activated: true,
    activated_at: Time.zone.now
  )
    trung.activation_token = User.new_token
    UserMailer.account_activation trung
  end

end
