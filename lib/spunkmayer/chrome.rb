require 'sqlite3'

module Spunkmayer

  module Chrome

    # currently supports only OSX.
    def self.cookie_path
      "#{Spunkmayer::homedir}/Library/Application Support/Google/Chrome/Default/Cookies"
    end

    def self.cookies(domain)
      hk = host_key domain
      db = SQLite3::Database.open cookie_path
      fields = [ :host_key, :path, :name, :value, :expires_utc ]
      sql_fields = fields.map { |f| f.to_s }.join(', ')
      rows = db.execute "select #{sql_fields} from cookies where host_key like '%#{hk}%'"
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
