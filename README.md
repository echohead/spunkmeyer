# spunkmayer

Grab cookies from your browser from ruby code.

# requirements

Currently, the only supported browser is Chrome on OSX.

# installation

    gem install spunkmayer

# library usage

```ruby
require 'spunkmayer'

puts Spunkmayer.cookies('http://google.com')
```
