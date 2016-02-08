# Bunto::Gist

Liquid tag for displaying GitHub Gists in Bunto sites: `{% gist %}`.

[![Build Status](https://travis-ci.org/bunto/bunto-gist.svg?branch=master)](https://travis-ci.org/bunto/bunto-gist)

## Installation

Add this line to your application's Gemfile:

    gem 'bunto-gist'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bunto-gist

Finally, add the following to your site's `_config.yml`:

```
gems:
  - bunto-gist
```

## Usage

Use the tag as follows in your Bunto pages, posts and collections:

```liquid
{% gist parkr/c08ee0f2726fd0e3909d %}
```

This will create the associated script tag:

```html
<script src="https://gist.github.com/parkr/c08ee0f2726fd0e3909d.js"> </script>
```

You may optionally specify a `filename` after the `gist_id`:

```liquid
{% gist parkr/c08ee0f2726fd0e3909d test.md %}
```

This will produce the correct URL to show just the specified file in your post rather than the entire Gist.

**Pro-tip**: If you provide a personal access token with Gist scope, as the environmental variable `JEKYLL_GITHUB_TOKEN`, Bunto Gist will use the Gist API to speed up site generation.

## Disabling `noscript` support

By default, Bunto Gist will make an HTTP call per Gist to retrieve the raw content of the Gist. This information is used to propagate `noscript` tags for search engines and browsers without Javascript support. If you'd like to disable this feature, for example, to speed up builds locally, simply add the following to your site's `_config.yml`:

```yml
gist:
  noscript: false
```

## Contributing

1. Fork it ( https://github.com/bunto/bunto-gist/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
