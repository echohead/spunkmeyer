require 'sqlite3'

module Spunkmeyer

  module Chrome

    def self.cookie_path
      case Spunkmeyer.os
      when :osx
        "#{Dir.home}/Library/Application Support/Google/Chrome/Default/Cookies"
      when :linux
      case browser 
        when :chrome 
          "#{Dir.home}/.config/google-chrome/Default/Cookies"
        when :firefox 
          Dir.glob("#{Dir.home}/.mozilla/firefox/*.default/cookies.sqlite").first
        end
      else
        raise 'Spunkmeyer::Chrome doesn\'t know this operating system.'
      end
    end

    def self.browser
      case Spunkmeyer.os
      when :osx
        :chrome
      when :linux
        if File.exists?("#{Dir.home}/.config/google-chrome/Default/Cookies")
          :chrome
        elsif File.exists?(Dir.glob("#{Dir.home}/.mozilla/firefox/*.default/cookies.sqlite").first)
          :firefox
        end 
      end
    end

    def self.cookies(domain)
      hk = host_key domain
      db = SQLite3::Database.open cookie_path
      case browser
      when :firefox
        fields = [ :host, :path, :name, :value, :expiry ]
        sql_fields = fields.map { |f| f.to_s }.join(', ')
        rows = db.execute "select #{sql_fields} from moz_cookies where host like '%#{hk}%'"
        fields = [ :host_key, :path, :name, :value, :expires_utc ]
      when :chrome
        fields = [ :host_key, :path, :name, :value, :expires_utc ]
        sql_fields = fields.map { |f| f.to_s }.join(', ')
        rows = db.execute "select #{sql_fields} from cookies where host_key like '%#{hk}%'"
      end
      rows.map! { |r| Hash[fields.zip r] }
      names = rows.map { |r| r[:name] }
      Hash[names.zip rows]
    end

    def self.host_key(domain)
      server = domain.scan(/:\/\/([^:#\/\?]+)/).flatten.first
      raise "Malformed domain!" unless server
      parts = server.split(".")
      ".#{parts[-2]}.#{parts[-1]}"
    end

  end

end
