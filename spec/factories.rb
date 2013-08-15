FactoryGirl.define do
	factory :user do
		sequence(:last_name)	{ |n| "Person #{n}" }
		first_name	"User"
		sequence(:email)		{ |n| "person_#{n}@example.com" }
		password	"foobar"
		password_confirmation "foobar"
		street_1	"96 Forestdale Rd."
		street_2	"Apt. 3B"
		city		"Rockville Centre"
		state		"NY"
		country		"USA"
		zip 		"11570"
		phone_o		"646-840-7146"
		phone_m		"917-207-3240"

		factory :admin do
			admin true
		end
	end

	factory :micropost do
		content "Lorem ipsum"
		user
	end
end
