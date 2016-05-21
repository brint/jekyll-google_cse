# Jekyll::GoogleCse
[![Gem Version](https://img.shields.io/gem/v/jekyll-google_cse.svg)][ruby-gems]
[![Build Status](https://travis-ci.org/brint/jekyll-google_cse.svg?branch=master)][travis]
[![Code Climate](https://codeclimate.com/github/brint/jekyll-google_cse/badges/gpa.svg)][codeclimate]
[![Test Coverage](https://codeclimate.com/github/brint/jekyll-google_cse/badges/coverage.svg)][coverage]
[![Dependency Status](https://gemnasium.com/badges/github.com/brint/jekyll-google_cse.svg)][gemnasium]

[ruby-gems]: https://rubygems.org/gems/jekyll-google_cse
[travis]: https://travis-ci.org/brint/jekyll-google_cse
[codeclimate]: https://codeclimate.com/github/brint/jekyll-google_cse
[coverage]: https://codeclimate.com/github/brint/jekyll-google_cse/coverage
[gemnasium]: https://gemnasium.com/github.com/brint/jekyll-google_cse

Add [Google Custom Search Engine](https://cse.google.com/) to your Jekyll site.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'jekyll-google_cse'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install jekyll-google_cse

## Usage

Add the necessary configuration to to `_config.yml`. Start by adding `jekyll-google_cse` to the list of gems for Jekyll to install:

```yaml
gems:
  - jekyll-google_cse
```

Next configure your site to use your "Search engine ID", which will be on the "Basics" page when you are configuring your custom search engine. In your Jekyll `_config.yml`, add your search engine ID:

```yaml
google_cse_id: "000000000000000000000:fffffffffff" # Use your search engine ID
```

Then add the following tag after the following line where you'd like the Google Custom Search Engine to be show:

```liquid
{% google_cse %}
```

 If you're not sure where to place the search engine, I'd recommend putting it in `_layouts/default.html` inside the `page-content` block:

```html
<div class="page-content">
  <div class="wrapper">
    {% google_cse %}
    {{ content }}
  </div>
</div>
```

Doing this will make the search engine appear at the top of every page.

If you have multiple environments, you may only want to have the Google Custom Search Engine appear in a specific environment. Here's an example of how to only use the Google Custom Search Engine in your `production` environment:

```liquid
{% if jekyll.environment == "production" %}{% google_cse %}{% endif %}
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/brint/jekyll-google_cse. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
