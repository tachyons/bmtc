# Bmtc

Bangalore Metropolitan Transport Corporation BMTC recently released its Intelligent Transport System (ITS) , But as of now there is no public api available . This is an reverse engineering approach to solve the issue

API Reference : https://github.com/tachyons/bmtc_api

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'bmtc'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bmtc

## Usage

Search for bustop
```ruby
Bmtc::BusStop.search <location>
Bmtc::BusStop.search "hsr"
```
Nearest bustop

```ruby
Bmtc::BusStop.nearest_stop <latitude>,<longitude>
```

Buses in a stop
```ruby
Bmtc::BusStop.buses_in_stop <bus_stop_id>
```
Get ttmc list

```ruby
Bmtc::TTMC.all
```

Get route map

```ruby
BMTC::route_map <route_id>
BMTC::route_map "171"
```

Get Trip fare

```ruby
BMTC.trip_fare(source: "HSR CPWD Quarters",destination:"Shanthinagara TTMC",service_type: :ordinary,no_adults: 1)
```

Service types can be either
* oridninary
* vajra
* vayu_vajra
* atal_sarige
* nice_service
* bengaluru_darshini
## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tachyons/bmtc. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
