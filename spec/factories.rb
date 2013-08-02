FactoryGirl.define do
	factory :user do
		first_name	"Chris"
		last_name	"Taylor"
		email		"cctaylor@gmail.com"
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
	end
end
