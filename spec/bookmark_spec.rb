require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns a list of bookmarks' do
    
      con = PG.connect(dbname: 'bookmark_manager_test')
      
      con.exec("INSERT INTO bookmarks (url) VALUES ('https://playground.diagram.codes/d/sequence');")
      con.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
      con.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com/');")
      
      temp = Bookmark.new
      bookmarks = temp.all

      expect(bookmarks).to include('https://playground.diagram.codes/d/sequence')
      expect(bookmarks).to include('http://www.destroyallsoftware.com')
      expect(bookmarks).to include('http://www.google.com/')
    end
  end
  
  describe '.create' do
    it 'creates a new bookmark' do
      Bookmark.create(url: 'http://www.example.org')

      expect(Bookmark.all).to include 'http://www.example.org'
    end
  end
end