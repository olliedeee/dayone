require 'rails_helper'

feature 'User index page', :devise do
  scenario 'user sees own username' do
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)
    visit users_path
    expect(page).to have_content user.username.capitalize
  end
end