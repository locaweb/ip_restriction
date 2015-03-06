# IpRestriction

IP restriction use on rails routes in :constraints, for example to restrict access to URL /sidekiq

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ip_restriction'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ip_restriction

## Usage

```yaml
ips:
  - 10.20.30.1/24
  - 192.168.1.1/22
```

```ruby
IpRestriction.configure do |config|
  config.file_path = '/path/to/ips.yml'
end
```

```ruby
mount Sidekiq::Web, at: '/sidekiq', constraints: IpRestriction::AllowedIpsConstraint.new
```

## Contributing

1. Fork it ( https://github.com/locaweb/ip_restriction/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
