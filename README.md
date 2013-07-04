# spunkmeyer
[![Gem Version](https://badge.fury.io/rb/spunkmeyer.png)][gem]
[![Build Status](https://secure.travis-ci.org/echohead/spunkmeyer.png?branch=master)][travis]

[gem]: https://rubygems.org/gems/spunkmeyer
[travis]: http://travis-ci.org/echohead/spunkmeyer

Grab cookies from your browser from ruby code.

# requirements

Currently, the only supported browser is Chrome on OSX.

# installation

    gem install spunkmeyer

# library usage

```ruby
require 'spunkmeyer'

puts Spunkmeyer.cookies('http://github.com')
```
