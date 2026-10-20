# Changelog

All notable changes to this project will be documented in this file.

The format is based on Keep a Changelog and this project adheres to Semantic Versioning.

## [3.0.1] — 2026-10-20

### Fixed
- No more warnings on load on current Rubies: `URI.regexp is obsolete` (Ruby 3.4+) and "CGI library is
  removed from Ruby 4.0" (Ruby 4.0). The library now uses the RFC 2396 URI parser directly and requires
  only `cgi/escape`. Behaviour is unchanged.

### Changed
- Tested on Ruby 3.2, 3.3, 3.4 and 4.0 (was 2.0–3.3 and JRuby). No Ruby version constraint was added: the
  gem still installs on older Rubies, which are no longer tested.
- The gem contains only `lib/`, `README.md`, `LICENSE.txt` and `CHANGELOG.md` (it used to ship the
  repository's dotfiles, `Gemfile`, `Rakefile` and workflow). Its RubyGems page links to the source,
  changelog and issues.
- The specs that call ConvertAPI are tagged `live` and run only when `CONVERT_API_SECRET` is set.
- Releases are now cut from a GitHub Release `v{version}` and pushed with RubyGems Trusted Publishing. See
  [RELEASING.md](RELEASING.md).

## [3.0.0] — 2024-09-14

### Changed
- Credentials are sent in the `Authorization` header and configured with `config.api_credentials` (an API
  secret or token), which replaces `api_secret` and `token`.

### Removed
- Alternative converter support.

## [2.0.0] — 2024-08-04

### Added
- Token authentication.

[3.0.1]: https://github.com/ConvertAPI/convertapi-library-ruby/compare/v3.0.0...v3.0.1
[3.0.0]: https://github.com/ConvertAPI/convertapi-library-ruby/compare/v2.0.0...v3.0.0
[2.0.0]: https://github.com/ConvertAPI/convertapi-library-ruby/compare/v1.4.0...v2.0.0
