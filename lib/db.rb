require 'pg'

class DatabaseConnect

  def self.plug_in
    if ENV['ENVIRONMENT'] == 'test'
      @plug = PG.connect(dbname: 'diary_test')
    else
      @plug = PG.connect(dbname: 'diary')
    end
  end

  def self.execute(command)
    @plug.exec("#{command}")
  end
end