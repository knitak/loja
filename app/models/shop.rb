# == Schema Information
#
# Table name: shops
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  address    :string(255)
#  postalcode :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Shop < ActiveRecord::Base
  attr_accessible :address, :name, :postalcode

  validates :name, presence: true
  validates :address, presence: true
  validates :postalcode, presence: true, length: { maximum: 8}
end
