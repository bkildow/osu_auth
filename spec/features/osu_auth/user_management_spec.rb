require 'rails_helper'

feature 'User management' do
  scenario 'User can create a new user' do
    visit '/widgets/new'

    fill_in 'Name', :with => 'My Widget'
    click_button 'Create Widget'

    expect(page).to have_text('Widget was successfully created.')
  end
end
