# Installation

Add this line to your application's Gemfile:

```ruby
gem 'dns_diff'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install dns_diff

# Usage

First create a text file where each line is a DNS record type and a
hostname. For example:

    $ cat records.txt
    A michaeljcoyne.me
    TXT michaeljcoyne.me
    MX michaeljcoyne.me

Now run the `dns_diff compare` command to compare one nameserver against
another.

    $ dns_diff compare 1.1.1.1 8.8.8.8 records.txt
    Comparing 1.1.1.1 vs 8.8.8.8
    Querying A for michaeljcoyne.me... ✓
    Querying TXT for michaeljcoyne.me... ✓
    Querying MX for michaeljcoyne.me... ✓

If the nameservers differ in response the different records are
displayed in the output:

    $ dns_diff compare 1.1.1.1 ns.example.com records.txt
    Comparing 1.1.1.1 vs ns.example.com
    Querying CNAME for foo.bar.com... ✗
        1.1.1.1 returned ["baz.bar.com"]
        ns.example.com returned ["qux.bar.com"]

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/dns_diff.
