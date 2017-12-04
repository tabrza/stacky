feature 'sign out' do
  scenario 'user can sign out' do
    signup('test name', 'test', '223@test.com', '12345', '12345')
    click_button('Sign out')
    expect(page).to have_content('Stacky')
  end
end
