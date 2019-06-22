require 'entry'
require 'pg'

describe Entry do
  @one = 'It was a clear black night, a clear white moon'
  @two = 'Warren G. is on the streets, trying to consume'
  describe '.create' do
    it 'saves the diary entry' do
      entry = Entry.create(@one, @two)
      test_entry_data = PG.connect(dbname: 'diary_test').exec("SELECT * FROM entries WHERE id = #{entry.id};")
      expect(entry).to be_a(Entry)
      expect(entry.id).to eq(test_entry_data.first['id'])
      expect(entry.title).to eq("#{@one}")
      expect(entry.contents).to eq("#{@two}")
    end

    pending 'does not save the entry without title'
    
  end

  describe '.find' do
    it 'retrieves the correct entry by id' do
      new_entry = Entry.create(@one, @two)
      id = new_entry.id
      found_entry = Entry.find(id)
      expect(found_entry.title).to eq("#{@one}")
      expect(found_entry.contents).to eq("#{@two}")
    end
  end

  describe '.all' do
    it 'retrieves all diary entries' do
      new_entry = Entry.create(@one, @two)
      newer_entry = Entry.create(@two, @one)
      both = Entry.all
      expect(both).to be_a(Array)
      expect(both.first.title).to eq("#{@one}")
      expect(both.last.title).to eq("#{@two}")
    end
  end
end
