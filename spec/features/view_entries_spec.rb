# As a user
# So that I can browse my previous entries
# I want to see a list of Diary Entry Titles
RSpec.feature 'Viewing entries' do
  scenario 'viewing list of saved entries' do
    @entry_one = Entry.create('It was a clear black night, a clear white moon', 
      'Warren G. is on the streets, trying to consume')
    @entry_two = Entry.create('Just hit the eatside of the L.B.C', 
      'On a mission trying to find Mr. Warren G.')
    visit '/'
    click_link('View all Diary entries')
    expect(page).to have_content('Click on title to view contents')
    expect(page).to have_link("#{@entry_one.title}", :href => "/entries/#{@entry_one.id}")
    expect(page).to have_link("#{@entry_two.title}", :href => "/entries/#{@entry_two.id}")
  end

# As a user
# So that I can read my previous entries
# I want to click on a title to see the full Diary Entry
  scenario 'click on a title and see the contents' do
    @entry_one = Entry.create('It was a clear black night, a clear white moon', 
      'Warren G. is on the streets, trying to consume')
    visit '/'
    click_link('View all Diary entries')
    click_link("#{@entry_one.title}")
    expect(page).to have_content("#{@entry_one.title}")
    expect(page).to have_content("#{@entry_one.contents}")
    expect(page).to have_link('Back to list')
  end
end