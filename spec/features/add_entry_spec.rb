# As a user
# So that I can keep a daily diary
# I want to be able to add a new Diary Entry

feature 'Adding a diary entry' do
  scenario 'click on add new link on homepage and see add new entry link' do
    visit '/'
    expect(page).to have_content('Daily Diary app for serious coders')
    expect(page).to have_link('Write new Diary entry')
  end

  scenario 'click the add new entry link on home page and see the diary entry form' do
    visit '/'
    click_link('Write new Diary entry')
    expect(page).to have_content('Write some stuff')
  end

  scenario 'go directly to new entry view and see the form' do
    visit '/new'
    expect(page).to have_content('Write some stuff')
    expect(page).to have_field('title')
    expect(page).to have_field('contents')
    expect(page).to have_button('Save to Diary')
  end

# As a user
# So that I can identify my entry in future
# I want to give each Diary Entry a title

  scenario 'add a new diary entry and get the success message' do
    visit '/new'
    fill_in 'title', with: 'dear diary'
    fill_in 'contents', with: 'It was a clear black night, a clear white moon Warren G. is on the streets, trying to consume'
    click_button 'Save to Diary'
    expect(page).to have_content('New Diary entry successfully saved!')
  end
end
