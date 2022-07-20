# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '', type: :feature do
  describe 'index page' do

    it 'shows the right content' do
      visit root_path
      sleep 2
      expect(page).to have_content('Pages')
    end

    it 'show the login process' do
      visit root_path
      click_in 'Sign In'
    end

  end
end
