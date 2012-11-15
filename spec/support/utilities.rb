include ApplicationHelper

def valid_signin(user)
  fill_in "Name",    with: user.name
  fill_in "Postalcode", with: user.postalcode
  click_button "Sign in"
end

RSpec::Matchers.define :have_error_message do |message|
  match do |page|
    page.should have_selector('div.alert.alert-error', text: message)
  end
end
