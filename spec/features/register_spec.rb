# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Register', type: :feature do
  let(:existing_user) { create(:user) }

  context 'new user with uniaue email' do
    it 'should register the user' do
      visit root_path
      click_link 'Register new account'
      fill_in 'user_name', with: 'New User'
      fill_in 'user_email', with: 'new_use@himama.co'
      click_button 'Register'
      expect(current_path).to eq clock_index_path
    end
  end

  context 'existing user email' do
    it 'should not register the user' do
      visit root_path
      click_link 'Register new account'
      fill_in 'user_name', with: existing_user.name
      fill_in 'user_email', with: existing_user.email
      click_button 'Register'
      expect(page.body).to have_text 'Email has already been taken'
    end
  end
end
