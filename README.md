# VedDecoder

VedDecoder is a decoder for the Google ved parameter.

Links to `ved`'s explanations:
* https://dfir.blog/google-ved-versions/
* https://deedpolloffice.com/blog/articles/decoding-ved-parameter

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ved_decoder'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install ved_decoder

## Usage

```ruby
# Decode ved starts with '1'
v = VedDecoder.decode('1t:22,r:6,i:86,s:90')
# => <VedDecoder::Ved: index: 86, type: 22, result_position: 6, start_page: 90>

# Decode ved starts with '0' or '2'
v = VedDecoder.decode('2ahUKEwjZ5rDNt67pAhVDLKwKHS4wDD4QzLECKAEwSnoECBYQCg')
# => <VedDecoder::Ved: type: 39116, sub_result_position: 1, result_position: 74>

# Get values
v.to_h
# => {:type=>39116, :sub_result_position=>1, :result_position=>74}
v.type
# => 39116
v.result_position
# => 74
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
