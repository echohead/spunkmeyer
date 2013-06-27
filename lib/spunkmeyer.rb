require 'spunkmeyer/chrome'

module Spunkmeyer

  def self.cookies(domain)
    Chrome.cookies domain
  end

end
