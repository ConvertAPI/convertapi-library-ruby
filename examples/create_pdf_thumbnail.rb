require 'convert_api'
require 'tmpdir'

ConvertApi.configure do |config|
  config.api_credentials = ENV['API_TOKEN'] # your api token
end

# Example of converting the first page of a PDF to a JPG thumbnail.
# https://www.convertapi.com/pdf-to-jpg

jpg_result = ConvertApi.convert(
  'jpg',
  {File: 'files/test.pdf',
  PageRange: 1,
  ImageHeight: 300,
  ImageWidth: 300,
  FitToSize: true}
)

saved_files = jpg_result.save_files(Dir.tmpdir)

puts "The thumbnail saved to #{saved_files}"