# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '', test: :system do
  describe '' do
    before(:each) do
      User.create(email: 'lalo@lalo.com', password: '123456')
    end

    it 'creates a Post', js: true do
      visit '/users/sign_in'
      fill_in 'Email', with: 'lalo@lalo.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'

      fill_in 'title', with: 'My First Post'
      fill_in 'body', with: 'A great body here!'
      sleep(2)
      click_button 'Add Post'
      sleep(1)
      #fill_in 'title', with: ''
      #fill_in 'body', with: ''

      expect(page).to have_content('My First Post')
    end
  end
end
