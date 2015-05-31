require "rails_helper"

feature "user sign in", %{
	As a signed up user
	I want to sign in so that I can access my account
}	do
	scenario "specify valid credentials" do
		user = FactoryGirl.create(:user)

		visit new_user_session_path

		sign_in_as(user)

		expect(page).to have_content("Signed in successfully")
		expect(page).to have_content("Sign Out")
	end
end