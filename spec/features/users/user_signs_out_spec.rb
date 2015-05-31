require "rails_helper"

feature "user signs out", %{
	As an authenticated user
	I want to sign out
	so that my screen identity if forgottne on the computer I am using"
} do

	scenario "authenticated user signs out" do
		user = FactoryGirl.create(:user)

		visit new_user_session_path
		sign_in_as(user)

		click_link "Sign Out"
		expect(page).to have_content("Signed out successfully.")		
	end	

	scenario "unauthenticated user signs out" do
		visit "/"
		expect(page).to_not have_content("Sign Out")		
	end
end