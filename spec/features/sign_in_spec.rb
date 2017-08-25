require 'rails_helper'

feature 'Sign in', :devise do
  
	scenario 'user cannot sign in if not registered' do
		signin('person@example.com', 'password')
		expect(page).to have_content 'Invalid Email or password.'
	end

# 	scenario 'user cannot sign in without confirming email' do
# 		user = FactoryGirl.create(:user2)
# 		signin(user.email, user.password)
# 		expect(page).to have_content 'You have to confirm your email address before continuing.'
# 	end	

	scenario 'user can sign in with valid credentials' do
		user = FactoryGirl.create(:user)
		signin(user.email, user.password)
		expect(page).to have_content 'Signed in successfully.'
	end

	scenario 'user cannot sign in with wrong email' do
    user = FactoryGirl.create(:user)
    signin('invalid@email.com', user.password)
		expect(page).to have_content 'Invalid Email or password.'
  end

  scenario 'user cannot sign in with wrong password' do
    user = FactoryGirl.create(:user)
    signin(user.email, 'invalidpass')
		expect(page).to have_content 'Invalid Email or password.'
  end
end