namespace :db do
	namespace :dev do
		desc "USAGE: rake db:dev:init"
		task :init do
			puts "Reinitializing the development database"
			system("rake db:drop db:create db:migrate db:seed")
		end
	end

	namespace :test do
		desc "USAGE: rake db:test:init"
		task :init do
			puts "\n\nReinitializing the test database\n"
	    	system("rake db:drop db:create db:migrate RAILS_ENV=test")
    		# system("RAILS_ENV=test rake parallel:drop parallel:create parallel:migrate")
		end
	end
end