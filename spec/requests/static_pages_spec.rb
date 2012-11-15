require 'spec_helper'

describe "StaticPages" do

	subject { page }

  	describe "home page" do
  		before { visit root_path }

  		it { should have_selector('h1', text: 'Recibos Online') }
  		it { should have_selector 'title', text: full_title('') }
  		it { should_not have_selector 'title', text: '| Home' }

    #it "should have the h1 'Recibos Online'" do
     # visit '/static_pages/home'
      #page.should have_content('h1', :text => 'Recibos Online')
    #end

    #it "should have the title 'Home'" do
     # visit '/static_pages/home'
      #page.should have_selector('title',
       #                 :text => "Recibos Online | Home")
    #end
  end

  	describe "escrita page" do
  		before { visit escrita_path }

  		it { should have_selector('h1', text: 'Escrita Inteligente') }
  		it { should have_selector('title', text: full_title('Escrita Inteligente')) }
  	#it "should have the h1 'Escrita Inteligente'" do
  	#	visit '/static_pages/escrita'
  	#	page.should have_content('h1', :text => 'Escrita Inteligente')
  	#end

  	#it "should have the title 'Escrita Inteligente'" do
     # visit '/static_pages/escrita'
      #page.should have_selector('title',
       #                 :text => "Recibos Online | Escrita Inteligente")
    #end
  end
end
