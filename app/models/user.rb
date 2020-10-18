class User < ApplicationRecord
  attr_accessor :activation_token
  VALID_EMAIL_REGEX = Settings.validations.user.email_regex
  VALID_PHONE_REGEX = Settings.validations.user.phone_regex
  USER_CREATE_PARAMS = %i(full_name email password password_confirmation phone_number city_id).freeze

  belongs_to :city
  has_one :host_information, dependent: :destroy
  has_many :places, foreign_key: :host_id, primary_key: :id, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :full_name, presence: true,
    length: {minimum: Settings.validations.user.name_minlength,
             maximum: Settings.validations.user.name_maxlength}

  validates :email, presence: true,
    length: {minimum: Settings.validations.user.email_minlength,
             maximum: Settings.validations.user.email_maxlength},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}

  validates :password, presence: true,
    length: {minimum: Settings.validations.user.password_minlength,
             maximum: Settings.validations.user.password_maxlength},
    allow_nil: true

  validates :phone_number, presence: true,
    length: {minimum: Settings.validations.user.phone_minlength,
             maximum: Settings.validations.user.phone_maxlength},
    format: {with: VALID_PHONE_REGEX},
    uniqueness: {case_sensitive: false}

  validates :is_host, inclusion: [true, false]

  before_save :downcase_email
  before_create :create_activation_digest

  has_secure_password
  def self.from_omniauth auth
    where(email: auth.info.email).first_or_initialize.tap do |user|
      user.id = auth.uid
      user.name = auth.info.name
      user.google_id = auth.credentials.token
      user.google_id_expires_at = Time.zone.at(auth.credentials.expires_at)
      user.save!
    end
  end

  def register
    UserMailer.account_activation(self).deliver_now unless activated
    JsonWebToken.encode id: @user.id, is_host: false
  end

  def authenticated? attribute, token
    digest = send("#{attribute}_digest")
    return false if digest.nil?

    BCrypt::Password.new(digest).is_password?(token)
  end

  def activate
    update(activated: true)
    update(activated_at: Time.zone.now)
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def self.digest string
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  private
  def create_activation_digest
    self.activation_token = User.new_token
    self.activation_digest = User.digest(activation_token)
  end

  def downcase_email
    email.downcase!
  end
end
