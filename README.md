# ConvertAPI Ruby Client


[![Gem](https://img.shields.io/gem/v/convert_api.svg)](https://rubygems.org/gems/convert_api)
[![Build](https://github.com/ConvertAPI/convertapi-library-ruby/actions/workflows/build.yml/badge.svg?branch=main)](https://github.com/ConvertAPI/convertapi-library-ruby/actions/workflows/build.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)


## Convert your files with our online file conversion API

ConvertAPI helps in converting various file formats. Creating PDF and Images from various sources like Word, Excel, Powerpoint, images, web pages or raw HTML codes. Merge, Encrypt, Split, Repair and Decrypt PDF files and many other file manipulations. You can integrate it into your application in just a few minutes and use it easily.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'convert_api'
```

## Usage

### Configuration

You can get your credentials at [https://www.convertapi.com/a/authentication](https://www.convertapi.com/a/authentication)

```ruby
ConvertApi.configure do |config|
  config.api_credentials = 'api-token'
end
```

### File conversion

Example to convert file to PDF. All supported formats and options can be found
[here](https://www.convertapi.com/doc/supported-formats).

```ruby
result = ConvertApi.convert('pdf', { File: '/path/to/my_file.docx' })

# save to file
result.file.save('/path/to/save/file.pdf')
```

Other result operations:

```ruby
# save all result files to folder
result.save_files('/path/to/save/files')

# get result file io
io = result.file.io

# get conversion cost
conversion_cost = result.conversion_cost 
```

#### Convert file url

```ruby
result = ConvertApi.convert('pdf', { File: 'https://website/my_file.docx' })
```

#### Specifying from format

```ruby
result = ConvertApi.convert(
  'pdf', 
  {File: /path/to/my_file'}, 
  from_format: 'docx'
)
```

#### Additional conversion parameters

ConvertAPI accepts extra conversion parameters depending on converted formats. All conversion 
parameters and explanations can be found [here](https://www.convertapi.com/doc/supported-formats).

```ruby
result = ConvertApi.convert(
  'pdf', 
  {File: /path/to/my_file.docx',
  PageRange: '1-10',
  PdfResolution: '150'}
)
```

#### Accessing result file properties

You can access result file collection like this:

```ruby
result = ConvertApi.convert('pdf', { File: 'https://website/my_file.docx' })

puts result.files[0].url
puts result.files[0].size
```

### User information

You can always check your usage by fetching [user information](https://www.convertapi.com/doc/user).

```ruby
user_info = ConvertApi.user

puts user_info['ConversionsConsumed']
```

### Alternative domain

Set config `base_uri` attribute to use other service domains. Dedicated to the region [domain list](https://www.convertapi.com/doc/servers-location).

```ruby
ConvertApi.configure do |config|
  config.base_uri = URI('https://eu-v2.convertapi.com/')
end
```


### More examples

Find more advanced examples in the [examples/](https://github.com/ConvertAPI/convertapi-library-ruby/tree/main/examples) folder.


## Development

Run `bundle exec rake spec` to run the specs. Without an API token only the offline specs run; with
`CONVERT_API_SECRET=your_api_token bundle exec rake spec` the specs that call ConvertAPI run too
(set `CONVERT_API_BASE_URI` to test against another deployment).

To install this gem onto your local machine, run `bundle exec rake install`. Releases are published from
GitHub Releases only; see [RELEASING.md](RELEASING.md) and [CHANGELOG.md](CHANGELOG.md).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ConvertAPI/convertapi-library-ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
