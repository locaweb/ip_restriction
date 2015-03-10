# IpRestriction

[![Build Status](https://travis-ci.org/locaweb/ip_restriction.svg?branch=master)](https://travis-ci.org/locaweb/ip_restriction)

A simple way to create a white list of IPs that can do something. We create it to restrict some routes to work just for some IPs.

If you are using Ruby on Rails you can add our `constraints` to restrict the access to `sidekiq` web interface.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ip_restriction'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ip_restriction

## Usage with Ruby on Rails

Create a yml file with the list of IPs.
```yaml
ips:
  - 10.20.30.1/24
  - 192.168.1.1/22
```

Configure the IpRestriction to load your yml file.
```ruby
IpRestriction.configure do |config|
  config.file_path = '/path/to/ips.yml'
end
```
Then in you routes add a constraint.
```ruby
mount Sidekiq::Web, at: '/sidekiq', constraints: IpRestriction::AllowedIpsConstraint.new
```

## Usage manually

You can check if an IP is allowed manually.
```ruby
checker = IpRestriction::IpChecker.new(['10.20.30.0/24'])
checker.allowed?('10.20.30.100')
# => true
checker.allowed?('10.10.30.100')
# => false
```

## Contributors

* André Souza (@andrerocker)
* Bruno Alvares da Costa (@brunoadacosta)
* Eron Junior
* Fabio Perrella (@fabioperrella)
* Fernando Amorim (@prodis)
* Marcio Trindade (@marciotrindade)

## Contributing

1. Fork it ( https://github.com/locaweb/ip_restriction/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
