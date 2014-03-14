# Jekyll::Languages

[![Build Status](https://travis-ci.org/janlindblom/jekyll-languages.png?branch=master)](https://travis-ci.org/janlindblom/jekyll-languages)

## Installation

### Jekyll plugin system

In your `_config.yml` file, add a new array with the key gems and the values of the gem names of the plugins you’d like to use. In this case:

		gems: [jekyll-languages]

### Via Bundler

Add this line to your application's `Gemfile`:

    gem 'jekyll-languages'

To use it, add the following to _plugins/ext.rb:

		require "jekyll/languages"

## Usage

```html
<p><strong>Categories:</strong> {{ page.categories | sentencize_array }}</p>
```

### Configuration

This plugin allows for some configuration options, use them in your `_config.yml` to make it actually do something useful:

```yaml
jekyll_languages:
	array_connector: "och"
```

## Contributing

1. Fork it ( http://github.com/janlindblom/jekyll-languages/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
