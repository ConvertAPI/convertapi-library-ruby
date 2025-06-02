require 'convert_api'

ConvertApi.configure do |config|
  config.api_credentials = ENV['API_TOKEN'] # your api token
end

# Retrieve user information
# https://www.convertapi.com/doc/user

puts ConvertApi.user