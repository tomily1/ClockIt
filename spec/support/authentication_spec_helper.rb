# frozen_string_literal: true

module AuthenticationSpecHelper
  def login(email)
    visit root_path
    fill_in 'user_email', with: email
    click_button 'Login'
  end
end
