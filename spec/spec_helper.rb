# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'simplecov'
require 'capybara/rspec'
require 'capybara/poltergeist'

SimpleCov.start 'rails'
Capybara.asset_host = "http://localhost:3000"
Capybara.javascript_driver = :poltergeist
Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app,
    :js_errors => true,
    :debug => false,
    # http://www.jonathanleighton.com/articles/2012/poltergeist-0-6-0/
    :inspector => true
  )
end


# It will be removed in the future, when the gem will be updated
require 'shoulda/matchers/integrations/rspec'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

RSpec.configure do |config|
  # ## Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  #using factory girl instead of fixtures
  #config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
    config.color_enabled = true
    config.use_transactional_fixtures = false

    config.before(:suite) do
      DatabaseCleaner.clean_with(:truncation)
    end

    config.before(:each) do
      DatabaseCleaner.strategy = if example.metadata[:js]
                                   :truncation
                                 else
                                   :transaction
                                 end
      DatabaseCleaner.start
    end

    config.after(:each) do
      DatabaseCleaner.clean
    end


  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = "random"

  # Exclude slow tests except if the ENV["SLOW_SPECS"] is defined
  config.filter_run_excluding :slow unless ENV["SLOW_SPECS"]

  # A required workaround to get capybara working
  config.include Capybara::DSL

  #allow shorter factory commands
  config.include FactoryGirl::Syntax::Methods

  # Letter Opener test gem
  config.include(MailerMacros)
  config.before(:each) { reset_email }

  # Authentication specific helpers
  config.include(AuthMacros)
  config.include(OmniauthMacros)

  # Controller helpers
  config.include Devise::TestHelpers, type: :controller
  # OmniAuth.config.test_mode = true
end