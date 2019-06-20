require_relative 'db'

class Entry

  def self.create(title, contents)
    DatabaseConnect.execute("INSERT INTO entries 
      (title, contents) VALUES ('#{title}', '#{contents}');")  
      true
  end

  def initialize(title, date, contents)
    @title = title
    @date = date
    @contents = contents
  end
end