require 'spunkmeyer/chrome'

module Spunkmeyer

  def self.cookies(domain)
    Chrome.cookies domain
  end


  def self.homedir
    File.expand_path Etc.getpwuid.dir
  end

end
