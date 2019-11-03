require 'rails_helper'

RSpec.describe 'Clock', type: :feature do
  let(:user) { create(:user) }

  describe 'index page' do
    context "logged in" do
      before do
        login(user.email)
      end

      context 'with no clock event', js: true do
        it "shows the welcome page" do
          expect(page.body).to have_content("Welcome #{user.name}")
        end

        it "shows an empty table" do
          sleep 3 # wait for ajax
          expect(page.body).to have_content("No data available in table")
        end
      end

      context "with new clock event", js: true do
        it "can add event to history" do
          click_link "Add New Entry"
          expect(current_path).to eq new_clock_path
          fill_in "clock_details", with: "foo bar"
          choose("Clock Out")
          click_button "Log Event"
          expect(current_path).to eq clock_index_path
          sleep 3 # wait for ajax
          expect(page.body).to have_content("foo bar")
          expect(page.body).to have_content("Clock Out")
        end

        it "can delete event from history" do
          clock = create(:clock, user: user)
          page.all(".fa-trash")[0].click
          a = page.driver.browser.switch_to.alert
          a.accept
          sleep 3 # wait for ajax
          expect(page.body).to have_content("No data available in table")
        end
      end
    end
  end
end
