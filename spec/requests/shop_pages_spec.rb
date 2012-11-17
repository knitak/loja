require 'spec_helper'

describe "ShopPages" do

	subject { page }

  describe "index" do

  let(:shop) { FactoryGirl.create(:shop) }

    before(:each) do
      sign_in user
      visit users_path
    end

    #before do
     # sign_in FactoryGirl.create(:user)
      #FactoryGirl.create(:user, name: "Bob", postalcode: "0000-001")
      #visit users_path
    #end

    it { should have_selector('title', text: 'All shops') }
    it { should have_selector('h1',    text: 'All shops') }

    describe "pagination" do

      before(:all) { 30.times { FactoryGirl.create(:shop) } }
      after(:all)  { Shop.delete_all }

      it { should have_selector('div.pagination') }


    it "should list each user" do
      Shop.paginate(page: 1).each do |shop|
      #Shop.all.each do |user|
        page.should have_selector('li', text: shop.name)
      end
    end
  end

  describe "delete links" do

    it { should_not have_link('delete') }

    describe "as an admin user" do
      let(:admin) { FactoryGirl.create(:admin) }
      before do
        sign_in admin
        visit users_path
      end

      it { should have_link('delete', href: shop_path(Shop.first)) }
      it "should be able to delete another shop" do
        expect { click_link('delete') }.to change(Shop, :count).by(-1)
      end

        it { should_not have_link('delete', href: shop_path(admin)) }
      end
    end
  end

	describe "profile page" do
    let(:user) { FactoryGirl.create(:shop) }
    before { visit shop_path(shop) }

    it { should have_selector('h1',    text: shop.name) }
    it { should have_selector('title', text: shop.name) }
  end

  describe "pesquisa page" do

  	before { visit pesquisa_path }

    let(:submit) { "Pesquisar" }
    
    it { should have_selector('h1',    text: 'Pesquisa') }
    it { should have_selector('title', text: full_title('Pesquisa')) }
  end

  describe "signup page" do
    before { visit signup_path }

    let(:submit) { "Create my account" }

    describe "with invalid information" do
      it "should not create a user" do
      expect { click_button submit }.not_to change(User, :count)
    end

    describe "error messages" do
      before { click_button submit }

      it { should have_selector('title', text: 'Sign up') }
      it { should have_content('error') }
    end

    describe "with valid information" do
      before do
        fill_in "Name",         with: "Example User"
        fill_in "Address",      with: "Rua do Sobe e Desce"
        fill_in "Postalcode",   with: "1234-567"
      end

      it "should create a shop" do
        expect { click_button submit }.to change(Shop, :count).by(1)
      end

      describe "after saving the shop" do
        	
        it { should have_link('Sign out') }
      end
    end
  end

  describe "edit" do
   	let(:shop) { FactoryGirl.create(:shop) }
   	before do
      sign_in user
      visit edit_user_path(user)
    end
   	describe "page" do
   		it { should have_selector('h1', text: "Update your profile") }
   		it { should have_selector('title', text: "Edit user") }
   		it { should have_link('change', href: 'http://gravatar.com/emails') }
   	end


    describe "with invalid information" do
    	before { click_button "Save changes" }

   			it { should have_content('error') }
   		end

   		describe "with valid information" do
        let(:new_name)  { "New Name" }
        let(:new_postalcode) { "1234-567" }
        before do
          fill_in "Name",             with: new_name
          fill_in "Address",          with: new_address
          fill_in "Postalcode",       with: user.postalcode
          click_button "Save changes"
        end
    	  
        it { should have_selector('title', text: new_name) }
        it { should have_selector('div.alert.alert-success') }
        it { should have_link('Sign out', href: signout_path) }
        specify { shop.reload.name.should  == new_name }
        specify { shop.reload.postalcode.should == new_postalcode }
      end
    end
  end
end
