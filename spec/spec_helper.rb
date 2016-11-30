<<<<<<< HEAD
# Generated by rspec-sinatra. (2016-11-29 11:54:56 +0000)

ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', 'app.rb')
=======
ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', 'app/app.rb')
>>>>>>> d7cff8d6c08aeb934ef91e9ca5031dad48d6c11e

require 'capybara'
require 'capybara/rspec'
require 'rspec'
<<<<<<< HEAD
require 'rack'
require 'database_cleaner'


# require_relative './features/web_helpers.rb' --> commented out til we can
# figure out wif we need it....

Capybara.app = BookmarkManager
# hmm - should be generated by `rspec --init` directly rather than copy paste ...

# This file was generated by the `rspec --init` command. Conventionally, all
# specs live under a `spec` directory, which RSpec adds to the `$LOAD_PATH`.
# The generated `.rspec` file contains `--require spec_helper` which will cause this
# file to always be loaded, without a need to explicitly require it in any files.
#
# Given that it is always loaded, you are encouraged to keep this file as
# light-weight as possible. Requiring heavyweight dependencies from this file
# will add to the boot time of your test suite on EVERY test run, even for an
# individual file that may not need all of that loaded. Instead, consider making
# a separate helper file that requires the additional dependencies and performs
# the additional setup, and require it from the spec files that actually need it.
#
# The `.rspec` file also contains a few flags that are not defaults but that
# users commonly want.
#
# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|

  DatabaseCleaner.clean_with(:truncation)

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.append_after(:each) do
    DatabaseCleaner.clean
  end


  # config.use_transactional_fixtures = false
  #
  # config.before(:suite) do
  #   if config.use_transactional_fixtures?
  #     raise(<<-MSG)
  #       Delete line `config.use_transactional_fixtures = true` from rails_helper.rb
  #       (or set it to false) to prevent uncommitted transactions being used in
  #       JavaScript-dependent specs.
  #
  #       During testing, the app-under-test that the browser driver connects to
  #       uses a different database connection to the database connection used by
  #       the spec. The app's database connection would not be able to access
  #       uncommitted transaction data setup over the spec's database connection.
  #     MSG
  #   end
  #   DatabaseCleaner.clean_with(:truncation)
  # end

  config.include Capybara::DSL
  # rspec-expectations config goes here. You can use an alternate
  # assertion/expectation library such as wrong or the stdlib/minitest
  # assertions if you prefer.
  config.expect_with :rspec do |expectations|
    # This option will default to `true` in RSpec 4. It makes the `description`
    # and `failure_message` of custom matchers include text for helper methods
    # defined using `chain`, e.g.:
    # be_bigger_than(2).and_smaller_than(4).description
    #   # => "be bigger than 2 and smaller than 4"
    # ...rather than:
    #   # => "be bigger than 2"
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  # rspec-mocks config goes here. You can use an alternate test double
  # library (such as bogus or mocha) by changing the `mock_with` option here.
  config.mock_with :rspec do |mocks|
    # Prevents you from mocking or stubbing a method that does not exist on
    # a real object. This is generally recommended, and will default to
    # `true` in RSpec 4.
    mocks.verify_partial_doubles = true
  end
=======
require 'database_cleaner'
require './app/models/link'

Capybara.app = Manager

RSpec.configure do |config|
  config.include Capybara::DSL
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.start
  end

  config.after(:suite) do
    DatabaseCleaner.clean
  end

>>>>>>> d7cff8d6c08aeb934ef91e9ca5031dad48d6c11e
end
