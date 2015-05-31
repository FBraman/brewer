require "rails_helper"

feature "user signs up", %{
	As a user, I want to create an account
} do
	
	scenario "provide valid registration information" do
		visit new_user_registration_path

		fill_in "Username", with: "foo"
		fill_in "Email", with: "foo@bar.com"
		fill_in "Password", with: "password"
		fill_in "Password confirmation", with: "password"

		click_button "Sign up"		
		expect(page).to have_content("Welcome! You have signed up successfully.")
		expect(page).to have_content("Sign Out")
	end 

	scenario "provide invalid registration information" do 
    visit new_user_registration_path

    click_button "Sign up"
    expect(page).to have_content("Email can't be blank")
    expect(page).to have_content("Username can't be blank")
    expect(page).to have_content("Password can't be blank")
  end

end