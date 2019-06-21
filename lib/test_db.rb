require 'pg'

def setup_test_db
  p "IM A TEST DATABASE RUNNING, POW POW POW"
  connection = PG.connect(dbname: 'diary_test')
  connection.exec("TRUNCATE entries;")
end

