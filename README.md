# Dee

[![Build Status](https://travis-ci.org/yuya-takeyama/dee.png?branch=develop)](https://travis-ci.org/yuya-takeyama/dee)
[![Coverage Status](https://coveralls.io/repos/yuya-takeyama/dee/badge.png?branch=develop)](https://coveralls.io/r/yuya-takeyama/dee?branch=develop)
[![Analytics](https://ga-beacon.appspot.com/UA-12392004-6/yuya-takeyama/dee)](https://github.com/igrigorik/ga-beacon)

Simple DI Container/Service Locater for Ruby

## Installation

Add this line to your application's Gemfile:

    gem 'dee'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dee

## Usage

```ruby
Foo = Struct.new(:name)

container = Dee::Container.new

# Define a value
container['foo.name'] = 'FOO'

# Define a factory
container.factory 'foo' do
  Foo.new(container['foo.name'])
end

# Define a singleton factory
container.singleton 'foo.singleton' do
  Foo.new(container['foo.name'])
end

# Create Foo object
# This creates Foo object everytime
foo = container['foo']

# Create singleton Foo object
# This creates Foo object only at the first time
# And it returns same object after the creation
foo = container['foo.singleton']
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
