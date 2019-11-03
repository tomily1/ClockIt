# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Log in', type: :feature do
  let(:existing_user) { create(:user) }
  let(:new_user) { build(:user) }

  context 'existing user' do
    it 'with correct email logs the user in' do
      visit root_path
      fill_in 'user_email', with: existing_user.email
      click_button 'Login'
      expect(current_path).to eq clock_index_path
    end
  end

  context 'non-existing user' do
    it 'should not log user in' do
      visit root_path
      fill_in 'user_email', with: new_user.email
      click_button 'Login'
      expect(page.body).to have_text 'invalid email, please sign up!'
      expect(current_path).to eq '/user/login'
    end
  end
end
