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

require 'spec_helper'

describe Shop do
  before do
    @shop = Shop.new(name: "Example Shop" ,address: "Rua x",
  							     postalcode: "1234-567")
  end

  subject { @shop }

  it { should respond_to(:name) }
  it { should respond_to(:address) }
  it { should respond_to(:postalcode) }
  it { should respond_to(:admin) }

  it { should be_valid }
  it { should_not be_admin }

  describe "with admin attribute set to 'true'" do
    before do
      @shop.save!
      @shop.toggle!(:admin)
    end

    it { should be_admin }
  end

  describe "Quando o nome nao existe" do
    before { @shop.name = " " }
    it { should_not be_valid }
  end

  describe "Quando a morada nao existe" do
    before { @shop.address = " " }
    it { should_not be_valid }
  end

  describe "Quando o codigo postal nao existe" do
    before { @shop.postalcode = " " }
    it { should_not be_valid }
  end

  describe "return value of authenticate method" do
    before { @shop.save }
    let(:found_shop) { Shop.find_by_name(@shop.name) }

    #describe "with valid postalcode" do
     #it { should == found_shop.authenticate(@shop.postalcode) }
  end

  #describe "with invalid postalcode" do
   #   let(:shop_for_invalid_postalcode) { found_shop.authenticate("invalid") }

    #  it { should_not == shop_for_invalid_postalcode }
     # specify { shop_for_invalid_postalcode.should be_false }
    #end
  #end

  
  

  

  

  #describe "Quando o nome e duplicado" do
   # before do
    #  user_with_same_name = @user.dup
     # user_with_same_name.save
    #end

    #it { should_not be_valid }
  #end


end
