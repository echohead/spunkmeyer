# spunkmeyer

Grab cookies from your browser from ruby code.

# requirements

Currently, the only supported browser is Chrome on OSX.

# installation

    gem install spunkmeyer

# library usage

```ruby
require 'spunkmeyer'

puts Spunkmeyer.cookies('http://google.com')
```
