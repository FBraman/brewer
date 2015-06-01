require "rails_helper"

feature "user updates account", %{
	As a user, I want the ability to 
	update my information
} do 
	scenario "update user information" do
		user = FactoryGirl.create(:user)

		visit root_path
		sign_in_as(user)
		visit edit_user_registration_path

		fill_in "Email", with: "foo@bar.com"
		fill_in "Current password", with: user.password

		click_button("Update")

		expect(page).to have_content("Your account has been updated successfully.")

		visit user_path(user)
		expect(page).to have_content("foo@bar.com")
	end
end