# spunkmeyer
[![Gem Version](https://badge.fury.io/rb/spunkmeyer.png)][gem]

[gem]: https://rubygems.org/gems/spunkmeyer

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
