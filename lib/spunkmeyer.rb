require 'spunkmeyer/chrome'
require 'spunkmeyer/os'

module Spunkmeyer

  def self.cookies(domain)
    Chrome.cookies domain
  end

end
