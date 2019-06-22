require 'pg'

class Entry

  attr_reader :id
  attr_reader :title
  attr_reader :contents

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

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      plug = PG.connect(dbname: 'diary_test')
    else
      plug = PG.connect(dbname: 'diary')
    end
    all_entries = plug.exec("SELECT * FROM entries;")
    all_entries.map {|entry| Entry.new(entry['id'], entry['title'], entry['contents'])}
  end

  def self.find(find_id)
    if ENV['ENVIRONMENT'] == 'test'
      plug = PG.connect(dbname: 'diary_test')
    else
      plug = PG.connect(dbname: 'diary')
    end
    found_entry = plug.exec("SELECT * FROM entries WHERE id = #{find_id};")
    Entry.new(found_entry[0]['id'], found_entry[0]['title'], found_entry[0]['contents'])
  end

  def initialize(id, title, contents)
    @id = id
    @title = title
    @contents = contents
  end
end