require 'pg'

class DatabaseConnect

  attr_accessor :plug

  def self.plug_in
    if ENV['ENVIRONMENT'] == 'test'
      @plug = PG.connect(dbname: 'diary_test')
    else
      @plug = PG.connect(dbname: 'diary')
    end
  end

  def self.execute(sql)
    @plug.exec(sql)
  end
end