require_relative 'db'
require 'pg'

class Entry

  def self.create(title, contents)
    if ENV['ENVIRONMENT'] == 'test'
      plug = PG.connect(dbname: 'diary_test')
    else
      plug = PG.connect(dbname: 'diary')
    end
    result = plug.exec("INSERT INTO entries 
      (title, contents) VALUES ('#{title}', '#{contents}') 
      RETURNING id, title, contents;")  
    Entry.new(result[0]['id'], result[0]['title'], result[0]['contents'])
  end

  def initialize(id, title, contents)
    @id = id
    @title = title
    @contents = contents
  end
end