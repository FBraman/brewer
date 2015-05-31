require 'factory_girl'

FactoryGirl.define do
	factory :user do
		sequence(:username) { |u| "usename#{u}" }
		sequence(:email) { |n| "user#{n}@example.com" }
		password 'password'		
	end
		
end