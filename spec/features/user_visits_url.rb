require 'spec_helper'
require 'rails_helper'

feature 'User visits shortened Url' do
  context 'Sucessfully' do
    let(:url) { Url.create(original: 'dvoraliving.com/test') }
    
    scenario 'Redirect to corresponding url and increase count' do
      visit manage_redirect_path(shortened_url: url.shortened)

      url.reload

      expect(current_url).to eq(url.original)
      expect(url.count).to eq(1)
    end
  end

  context 'Failing ' do
    scenario 'Redirects to error page' do
      visit manage_redirect_path(shortened_url: '123')

      expect(page).to have_content 'The page you are looking for was not found.'
    end
  end
end
