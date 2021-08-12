feature 'visiting the homepage' do
  scenario 'the page title is visible' do
    visit '/'
    expect(page).to have_content 'Bookmark Manager'
  end
end

feature 'Viewing bookmarks' do
  scenario 'A user can see a list of bookmarks' do
    visit('/bookmarks')
    
    expect(page).to have_content "https://playground.diagram.codes/d/sequence"
    expect(page).to have_content "http://www.destroyallsoftware.com"
    expect(page).to have_content "http://www.google.com"
  end
end