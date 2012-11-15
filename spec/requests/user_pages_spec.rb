require 'spec_helper'

describe "UserPages" do

	subject { page }

	describe "profile page" do
    	let(:user) { FactoryGirl.create(:user) }
    	before { visit user_path(user) }

    	it { should have_selector('h1',    text: user.name) }
    	it { should have_selector('title', text: user.name) }
  	end

  	describe "pesquisa page" do

  	before { visit pesquisa_path }
    
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

    describe "with valid information" do
      before do
        fill_in "Name",         with: "Example User"
        fill_in "Address",      with: "Rua do Sobe e Desce"
        fill_in "Postalcode",   with: "1234-567"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end
  end
end
