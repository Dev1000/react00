# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '', type: :system do
  describe 'index page' do
    before :each do
      User.create(email: 'user@example.com', password: 'password')
    end

    it 'show the sign up process' do
      visit root_path
      click_link 'Sign Up'
      fill_in 'Email', with: 'javaimagination@gmail.com'
      fill_in 'Password', with: '123456'
      fill_in 'Password confirmation', with: '123456'
      sleep(1)
      click_button 'Sign up'
      sleep(1)
      click_link 'Sign out'

      expect(page).to have_content 'Log in'
    end

    it 'shows the sign in process' do
      visit '/users/sign_in'

      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
      sleep(1)

      expect(page).to have_content 'Users#dashboard'
    end
  end
end
