# Releasing

`main` is the only long-lived branch. Changes reach it through pull requests, merge commits only, and
every pull request and push to `main` must pass the `build` check (`.github/workflows/build.yml`: the
specs on Ruby 3.2, 3.3, 3.4 and 4.0, then build and install the gem). Merging publishes nothing.

A release is a **GitHub Release** whose tag is the version, published by `tomasr78`:

1. In a pull request, set `ConvertApi::VERSION` in `lib/convert_api/version.rb` to the new version (it is
   the gem's version and goes into the `User-Agent` of every request) and add the version to
   `CHANGELOG.md`. Merge it.
2. Wait for the `build` check of that merge on `main` to pass, then publish the release:

```bash
gh release create v3.0.1 --repo ConvertAPI/convertapi-library-ruby --target main --title v3.0.1 --generate-notes
```

That runs `.github/workflows/publish.yml`, which:

1. refuses a Release published or re-run by anyone else;
2. checks the tag (`v3.0.1`, `v3.1.0-rc.1`), that the GitHub pre-release tick matches the version, that
   the tagged commit is on `main`, that `ConvertApi::VERSION` at the tag is the version, and that RubyGems
   has never had that version;
3. runs the specs (the ones that call ConvertAPI too, when the `CONVERTAPI_SECRET` secret exists), builds
   the gem and checks that it installs and reports the version;
4. pushes the gem to RubyGems from the `rubygems` environment with Trusted Publishing (no stored key) and
   waits until RubyGems serves it.

**Pre-releases** work the same way and are also tagged on `main`. RubyGems writes pre-release versions
with dots, so the pre-release label is `alpha.N`, `beta.N` or `rc.N` (`v3.1.0-rc.1` is gem version
`3.1.0.rc.1`, which is what `ConvertApi::VERSION` must say):

```bash
gh release create v3.1.0-rc.1 --repo ConvertAPI/convertapi-library-ruby --target main --prerelease --title v3.1.0-rc.1 --notes "Release candidate for ..."
```

If the run fails before **Push to RubyGems**, nothing was published: fix the cause and re-run the failed
jobs, or delete the Release and its tag and release again. Once pushed, a RubyGems version is permanent: it
can be yanked but never pushed again. Fix a bad version by releasing the next one, and never move a release
tag.

## Guard rails

- Rulesets: `main` takes pull requests with merge commits and a passing `build` (admins can bypass); only
  repository admins create, move or delete `v*` tags, and a `v*` tag must be `v{major}.{minor}.{patch}`
  with an optional `-{alpha|beta|rc}.{n}`.
- The `rubygems` environment accepts deployments from `v*` tags only.
- RubyGems trusts `ConvertAPI/convertapi-library-ruby`, workflow `publish.yml`, environment `rubygems`
  (https://rubygems.org/gems/convert_api/trusted_publishers). Renaming the workflow file or the environment
  breaks publishing until the trusted publisher is changed to match.
- Until that trusted publisher exists, `publish.yml` falls back to the `RUBYGEMS_API_KEY` repository secret
  and says so in a warning. After the first release published by Trusted Publishing, delete the secret and
  the fallback step.
