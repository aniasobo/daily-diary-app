require 'entry.rb'
# As a user
# So that I can browse my previous entries
# I want to see a list of Diary Entry Titles

# As a user
# So that I can read my previous entries
# I want to click on a title to see the full Diary Entry

RSpec.feature 'Viewing entries' do
  scenario 'viewing list of saved entries' do
    visit '/new'
    @one = 'It was a clear black night, a clear white moon'
    @two = 'Warren G. is on the streets, trying to consume'
    fill_in 'title', with: "#{@one}"
    fill_in 'contents', with: "#{@two}"
    click_button 'Save to Diary'
    visit '/new'
    fill_in 'title', with: "#{@two}"
    fill_in 'contents', with: "#{@one}"
    click_button 'Save to Diary'
    visit '/'
    click_link('View all Diary entries')
    expect(page).to have_content('Click on title to view contents')
    expect(page).to have_link("#{@one}")
    expect(page).to have_link("#{@two}")
  end

  scenario 'click on a title and see the contents' do
    visit '/new'
    fill_in 'title', with: "#{@one}"
    fill_in 'contents', with: "#{@two}"
    click_button 'Save to Diary'
    visit '/'
    click_link('View all Diary entries')
    click_link("#{@one}")
    expect(page).to have_content("#{@one}")
    expect(page).to have_content("#{@two}")
    expect(page).to have_link('Back to list')
  end
end 
