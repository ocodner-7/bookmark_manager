require 'pg'

class Bookmark
  def self.all
   if ENV['ENVIRONMENT'] == 'test'
    con = PG.connect :dbname => 'bookmark_manager_test', :user => 'ec2-user'
   else
    con = PG.connect :dbname => 'bookmark_manager', :user => 'ec2-user'
   end
    
   rs = con.exec("SELECT * FROM bookmarks")
   
   bookmarks = []
   
   rs.each {|row| 
    bookmarks.push(row["url"])
   }
   return bookmarks
  end
  
  def self.create(url:)
   if ENV['ENVIRONMENT'] == 'test'
    con = PG.connect(dbname: 'bookmark_manager_test')
   else
    con = PG.connect(dbname: 'bookmark_manager')
   end

  con.exec("INSERT INTO bookmarks (url) VALUES('#{url}')")
  end
end

