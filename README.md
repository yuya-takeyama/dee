# Dee

[![Build Status](https://travis-ci.org/yuya-takeyama/dee.png?branch=develop)](https://travis-ci.org/yuya-takeyama/dee)

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
container = Dee::Container.new

# Define a value
container['foo.name'] = 'FOO'

# Define a factory
container.factory do 'foo'
  Foo.new(self['foo.name'])
end

# Define a singleton factory
container.singleton do 'foo.singleton' do
  Foo.new(self['foo.name'])
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
