feature 'sign up' do
  scenario 'user can sign up' do
    signup('test name', 'test', '223@test.com', '12345', '12345')
    expect(page).to have_content('posts')
  end

  scenario 'cannot sign up with wrong confirmation password' do
    signup('test name', 'test', '123@test.com', '12345', '22345')
    expect(page).to have_content('Password does not match the confirmation')
  end

  scenario 'cannot sign up if email address already exists' do
    signup('test name', 'test', '123@test.com', '12345', '12345')
    signup('test name', 'test', '123@test.com', '12345', '12345')
    expect(page).to have_content('Email is already taken')
  end
end
