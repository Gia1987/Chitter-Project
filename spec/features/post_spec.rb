feature 'Post message' do
  scenario 'A user can post own messages' do
    visit('/')
    click_on 'Post'
    fill_in('message', with: 'Ciao Sono Giacomo')
    click_on'Submit'
    expect(page).to have_content 'Ciao Sono Giacomo'
  end
end
