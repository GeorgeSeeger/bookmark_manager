feature "creating a new bookmark" do
  scenario "Adding a bookmark with a title and url" do
    visit('/links/new')
    fill_in("title", :with => "Google")
    fill_in("url", :with => "https://www.google.co.uk")
    fill_in('tags', with: "search")
    click_button("Save Link")
    expect(page).to have_text("Google")
  end
end
