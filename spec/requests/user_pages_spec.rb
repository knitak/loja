require 'spec_helper'

describe "UserPages" do

	subject { page }

  describe "pesquisa page" do

  before { visit pesquisa_path }
    
    it { should have_selector('h1',    text: 'Pesquisa') }
    it { should have_selector('title', text: full_title('Pesquisa')) }
  end
end
