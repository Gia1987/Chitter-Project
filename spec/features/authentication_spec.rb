feature 'authentication' do
  it 'a user can sign in' do
    User.create(email: 'giacomo@example.com', password: 'password123')

    visit '/session'
    fill_in(:email, with: 'giacomo@example.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')

    expect(page).to have_content 'Welcome, giacomo@example.com'
  end
  it 'a user sees an error if they get their email wrong' do
    User.create(email: 'giacomo@example.com', password: 'password123')

    visit '/session'
    fill_in(:email, with: 'nottherightemail@me.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')

    expect(page).not_to have_content 'Welcome, giacomo@example.com'
    expect(page).to have_content 'Please check your email or password.'
  end
  it 'a user sees an error if they get their password wrong' do
    User.create(email: 'giacomo@example.com', password: 'password123')

    visit '/session'
    fill_in(:email, with: 'giacomo@example.com')
    fill_in(:password, with: 'wrongpassword')
    click_button('Sign in')

    expect(page).not_to have_content 'Welcome, giacomo@example.com'
    expect(page).to have_content 'Please check your email or password.'
  end
  it 'a user can sign out' do
    # Create the user
    User.create(email: 'giacomo@example.com', password: 'password123')

    # Sign in as that user
    visit '/session'
    fill_in(:email, with: 'giacomo@example.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')

    # Sign out
    click_button('Sign out')

    expect(page).not_to have_content 'Welcome, giacomo@example.com'
    expect(page).to have_content 'You have signed out.'
  end
end
