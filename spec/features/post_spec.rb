feature 'Post message' do
  scenario 'A user can post own messages' do
    visit('/')
    click_on 'Post'
    fill_in('message', with: 'text')
    click_on'Submit'

    expect(page).to have_content 'text'
  end
end
