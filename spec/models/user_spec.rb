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

require 'spec_helper'

describe User do
  before do
    @user = User.new(name: "Example User",address: "Rua x",
  							     postalcode: "1234-567")
  end

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:address) }
  it { should respond_to(:postalcode) }
  it { should respond_to(:remember_token) }

  it { should be_valid }

  describe "Quando o nome nao existe" do
    before { @user.name = " " }
    it { should_not be_valid }
  end

  describe "Quando a morada nao existe" do
    before { @user.address = " " }
    it { should_not be_valid }
  end

  describe "Quando o codigo postal nao existe" do
    before { @user.postalcode = " " }
    it { should_not be_valid }
  end

  #describe "Quando o nome e duplicado" do
   # before do
    #  user_with_same_name = @user.dup
     # user_with_same_name.save
    #end

    #it { should_not be_valid }
  #end

  describe "remember token" do
    before { @user.save }
    its(:remember_token) { should_not be_blank }
  end 
end
