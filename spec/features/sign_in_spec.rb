require 'rails_helper'

feature 'sign in', :devise do 
  
  scenario 'user cannot sign in if not registered' do
    signin('person@example.com', 'password')
    expect(page).to have_content 'Invalid email or password'
  end
  
  scenario 'user can sign in with valid info' do
    user = FactoryGirl.create(:user)
    signin(user.email, user.password)
    expect(page).to have_content 'Signed in successfully'
  end
  scenario 'user cannot sign in with invalid email' do
    user = FactoryGirl.create(:user)
    signin('invalid@email.com', user.password)
    expect(page).to have_content 'Invalid email or password'
  end  

  scenario 'user can sign in with invalid password' do
    user = FactoryGirl.create(:user)
    signin(user.email, 'invalid password')
    expect(page).to have_content 'Invalid email or password'
  end
end