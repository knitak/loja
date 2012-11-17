# == Schema Information
#
# Table name: users
#
#  id                    :integer          not null, primary key
#  name                  :string(255)
#  address               :string(255)
#  postalcode            :string(255)
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  remember_token        :string(255)
#  admin                 :boolean          default(FALSE)
#  password              :string(255)
#  password_confirmation :string(255)
#  email                 :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :address, :name, :postalcode,
  				  :email, :password, :password_confirmation

  has_secure_password

  before_save :create_remember_token
  before_save { |user| user.email = email.downcase }

  validates :name, presence: true
  validates :password_confirmation, presence: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :address, presence: true
  validates :postalcode, presence: true, length: { maximum: 8}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
  					uniqueness: { case_sensitive: false}

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
