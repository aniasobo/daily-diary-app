require 'pg'

def setup_test_db
  connection = PG.connect(dbname: 'diary_test')
  connection.exec('TRUNCATE entries;')
end
