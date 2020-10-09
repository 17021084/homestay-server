class User < ApplicationRecord
  VALID_EMAIL_REGEX = Settings.validations.user.email_regex
  VALID_PHONE_REGEX = Settings.validations.user.phone_regex

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

  has_secure_password

  private

  def downcase_email
    email.downcase!
  end
end
