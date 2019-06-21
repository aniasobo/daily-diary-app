require 'entry'
require 'pg'
# require 'db'

describe Entry do
  describe '.create' do
    it 'saves the diary entry' do
      entry = Entry.create('It was a clear black night, a clear white moon',
        'Warren G. is on the streets, trying to consume')
      test_entry_data = PG.connect(dbname: 'diary_test').exec("SELECT * FROM entries WHERE id = #{entry.id};")

      expect(entry).to be_a Entry
      expect(entry.id).to eq test_entry_data.first['id']
      expect(entry.title).to eq 'It was a clear black night, a clear white moon'
      expect(entry.contents).to eq 'Warren G. is on the streets, trying to consume'
    end

    pending 'does not save the entry without title'
    
  end
end