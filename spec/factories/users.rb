FactoryGirl.define do
	factory :user do 
		email 	 	{ Faker::Internet.email }
		password 	{ 'passpass' }
	end
end