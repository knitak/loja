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
  it { should respond_to(:admin) }
  it { should respond_to(:authenticate) }
  it { should respond_to(:remember_token) }

  it { should be_valid }
  it { should_not be_admin }

  describe "with admin attribute set to 'true'" do
    before do
      @user.save!
      @user.toggle!(:admin)
    end

  describe "with valid postalcode" do
     it { should == found_user.authenticate(@user.postalcode) }
  end

    it { should be_admin }
  end

  describe "with invalid postalcode" do
      let(:user_for_invalid_postalcode) { found_user.authenticate("invalid") }

      it { should_not == user_for_invalid_postalcode }
      specify { user_for_invalid_postalcode.should be_false }
    end
  end

  describe "return value of authenticate method" do
    before { @user.save }
    let(:found_user) { User.find_by_name(@user.name) }

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
