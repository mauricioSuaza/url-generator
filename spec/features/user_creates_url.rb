require 'spec_helper'
require 'rails_helper'

feature 'User shortens Url' do
  context 'Sucessfully' do
    let(:url) {'test.com/123123' }

    scenario 'Creates a new valid shortened url' do
      visit root_path

      fill_in 'url[original]', with: url

      click_button "Shorten"

      expect(page).to have_content url
      expect(page).to have_css ".card-text", text: Url.first.shortened
    end

    scenario 'Gets an already existing url' do
      first_url = Url.create(original: url)

      visit root_path

      fill_in 'url[original]', with: url

      click_button "Shorten"

      click_link "Go Back"

      expect(Url.where(original: first_url.original).count).to eq(1) 
    end
  end

  context 'Failing ' do
    let(:url) {'test./123123' }

    scenario 'Tries to shorten an invalid url' do
      visit root_path

      fill_in 'url[original]', with: url

      click_button "Shorten"

      expect(page).to have_content "invalid"
    end
  end
end
