# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  address    :string(255)
#  postalcode :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :address, :name, :postalcode

  before_save :create_remember_token

  validates :name, presence: true
  validates :address, presence: true
  validates :postalcode, presence: true, length: { maximum: 8}

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
