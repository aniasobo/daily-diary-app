# As a user
# So that I can keep a daily diary
# I want to be able to add a new Diary Entry

feature 'Adding a diary entry' do
  scenario 'visit home page and see the diary entry form' do
    visit '/'
    expect(page).to have_content('Write some stuff')
  end

# As a user
# So that I can identify my entry in future
# I want to give each Diary Entry a title

  scenario 'add a new diary entry and get the success message' do
    visit '/'
    fill_in 'title', with: 'dear diary'
    fill_in 'contents', with: 'It was a clear black night, a clear white moon Warren G. is on the streets, trying to consume'
    click_button 'Save to Diary'
    expect(page).to have_content('dear diary saved')
  end
end
