require 'spec_helper'

describe "UserPages" do

	subject { page }

  let(:user) { FactoryGirl.create(:user) }

  describe "index" do

    before(:each) do
      sign_in user
      visit users_path
    

    #before do
     # sign_in FactoryGirl.create(:user)
      #FactoryGirl.create(:user, name: "Bob", postalcode: "0000-001")
      #visit users_path
    #end

      it { should have_selector('title', text: 'All users') }
      it { should have_selector('h1',    text: 'All users') }
    end


    describe "pagination" do

      before(:all) { 30.times { FactoryGirl.create(:user) } }
      after(:all)  { User.delete_all }

      it { should have_selector('div.pagination') }


      it "should list each user" do
        User.paginate(page: 1).each do |user|
      #User.all.each do |user|
        page.should have_selector('li', text: user.name)
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

        it { should have_link('delete', href: user_path(User.first)) }
        it "should be able to delete another user" do
          expect { click_link('delete') }.to change(User, :count).by(-1)
        end
        it { should_not have_link('delete', href: user_path(admin)) }
      end
    end
  end

	describe "profile page" do
    	let(:user) { FactoryGirl.create(:user) }
    	before { visit user_path(user) }

    	it { should have_selector('h1',    text: user.name) }
    	it { should have_selector('title', text: user.name) }
  	end
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
      end
    end
    

    describe "with valid information" do
      	before do
        	fill_in "Name",                    with: "Example User"
        	fill_in "Address",                 with: "Rua do Sobe e Desce"
        	fill_in "Postalcode",              with: "1234-567"
          fill_in "Email",                   with: "Example@user.com"
          fill_in "Password",                with: "Password"
          fill_in "Password_Confirmation",   with: "Password"
      	end

      	it "should create a user" do
        	expect { click_button submit }.to change(User, :count).by(1)
      	end

      	describe "after saving the user" do
        	
        	it { should have_link('Sign out') }
      	end
      end
    end

    describe "edit" do
   		let(:user) { FactoryGirl.create(:user) }
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
        let(:new_name)       { "New Name" }
        let(:new_email)      { "Example@user.com" }
        let(:new_address)    { "Rua do Sobe e Desce" }
        let(:new_postalcode) { "1234-567" }

        before do
          fill_in "Name",                    with: new_name
          fill_in "Address",                 with: new_address
          fill_in "Postalcode",              with: user_postalcode
          fill_in "Email",                   with: user_email
          fill_in "Password",                with: user.password
          fill_in "Password_Confirmation",   with: user.password_confirmation
          click_button "Save changes"
        end
    	  
        it { should have_selector('title', text: new_name) }
        it { should have_selector('div.alert.alert-success') }
        it { should have_link('Sign out', href: signout_path) }
        specify { user.reload.name.should  == new_name }
        specify { user.reload.postalcode.should == new_postalcode }
        specify { user.reload.email.should  == new_email }
        specify { user.reload.address.should  == new_address }
      end
    end
  end
end