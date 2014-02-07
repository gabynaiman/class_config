# ClassConfig

Class configuration attributes

## Installation

Add this line to your application's Gemfile:

    gem 'class_config'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install class_config

## Usage

    class MyClass
      extend ClassConfig
      attr_config :with_default, 'default value'
      attr_config :without_default
      attr_config :setting
    end

    MyClass.configure do |config|
      config.setting = 'configuration value'
    end

    MyClass.setting # => 'configuration value'

    MyClass.configuration # => {with_default: 'default value', without_default: nil, setting: 'configuration value'}

    MyClass.restore_default_configuration

    MyClass.configuration # => {with_default: 'default value', without_default: nil, setting: nil}

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
