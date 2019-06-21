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

  describe '.find' do
    it 'retrieves the correct entry' do
      title = 'It was a clear black night, a clear white moon'
      contents = 'Warren G. is on the streets, trying to consume'
      entry = Entry.create(title, contents)
      found_entry = Entry.find(title)
      expect(found_entry.title).to eq(title)
      expect(found_entry.contents).to eq(contents)
      expect(found_entry.id).to eq(entry.id)
    end
  end
end