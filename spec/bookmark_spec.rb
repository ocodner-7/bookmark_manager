require 'bookmark'

describe Bookmark do
  describe '#all' do
    it 'returns a list of bookmarks' do
      temp = Bookmark.new
      bookmarks = temp.all

      expect(bookmarks).to include('http://www.makersacademy.com/')
      expect(bookmarks).to include('http://www.destroyallsoftware.com')
      expect(bookmarks).to include('http://www.google.com/')
    end
  end
end