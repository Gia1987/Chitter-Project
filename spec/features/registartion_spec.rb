feature 'registration' do
  scenario 'a user can sign up' do
    visit '/users'
    fill_in('email', with: 'giacomo@example.com')
    fill_in('password', with: 'password123')
    click_button('Submit')

    expect(page).to have_content "Welcome, giacomo@example.com"
  end
end
