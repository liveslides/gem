# LiveSlides

Integrate LiveSlides into your Ruby web application.

[![Code Climate](https://codeclimate.com/github/liveslides/gem/badges/gpa.svg)](https://codeclimate.com/github/liveslides/gem) [![Build Status](https://travis-ci.org/liveslides/gem.svg)](https://travis-ci.org/liveslides/gem)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'liveslides'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install liveslides

## Usage

LiveSlides works in any Ruby web application framework, but support for the most popular are supported right out of the box.

### Rails

The LiveSlides gem Just Works™ with Rails when you add to your Gemfile. To add a "Download LiveSlide" button to your application, just call the helper:

```erb
<%= liveslide_button("https://my-website.com/awesome-content", title: "Awesome content") %>
```

### Sinatra

In Sinatra just require the LiveSlides gem and register the helper module:

```ruby
require 'sinatra/base'
require 'liveslides'

class HelloApp < Sinatra::Base
  helpers LiveSlides::Helper

  get "/hello" do
    redirect liveslides_slide_url("https://my-website.com/awesome-content", title: "Awesome content")
  end
end

run HelloApp
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/liveslides/gem.

