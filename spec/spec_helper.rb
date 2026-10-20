require 'bundler/setup'
require 'convert_api'

RSpec.configure do |config|
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  # Examples tagged `live: true` call the ConvertAPI service with the API token in CONVERT_API_SECRET, at
  # CONVERT_API_BASE_URI when set (e.g. https://stag-v2.convertapi.com/). Without a token they are skipped.
  if ENV['CONVERT_API_SECRET'].to_s.empty?
    config.filter_run_excluding live: true
    warn 'CONVERT_API_SECRET is not set, so the examples that call the ConvertAPI service (live: true) are skipped.'
  end

  config.before(:each) do
    ConvertApi.config.api_credentials = ENV['CONVERT_API_SECRET']
    ConvertApi.config.base_uri = URI(ENV['CONVERT_API_BASE_URI']) unless ENV['CONVERT_API_BASE_URI'].to_s.empty?
  end
end
