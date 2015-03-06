require 'ip_restriction'

require 'byebug'
require 'pry-byebug'

# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  config.mock_with :rspec
  config.filter_run :focus => true
  config.run_all_when_everything_filtered = true
end
