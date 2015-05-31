require "rails_helper"

feature "user deletes account", %{
	As a user, I want to delete my account
	so that my information is no longer retained by the app
} do
	
	scenario "user deletes account" do
		user = FactoryGirl.create(:user)
		sign_in_as(user)

		click_link "My Account"
		click_link "Edit my Account"	

		click_button "Delete my account"

		expect(page).to have_content("Bye! Your account has been successfully cancelled. We hope to see you again soon.")			
	end	
end