require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do
  before :each do
    User.create!(
      first_name: 'Zio',
      last_name: 'Tan',
      email: 'zio@tan.com',
      password: '123',
      password_confirmation: '123'
    )
  end

  scenario "should signup and login" do
    visit login_path
    fill_in'email', with:'zio@tan.com'
    fill_in'password', with:'123'
    
    click_button 'Submit'
    expect(page).to have_text('Signed in as Zio')
    
    # DEBUG
    save_screenshot "signin.png"

  end
end
