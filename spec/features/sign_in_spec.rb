def sign_in(email, password)
  visit '/'
  fill_in 'email', with: email
  fill_in 'password', with: password
  click_button 'Submit'
end

feature 'sign in' do
  scenario 'user can sign in' do
    signup('test name', 'test', '123@test.com', '12345', '12345')
    sign_in('123@test.com', '12345')
    expect(page).to have_content('posts')
  end
end
