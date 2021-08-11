require 'pg'

class Bookmark
  def all
   con = PG.connect :dbname => 'bookmark_manager', :user => 'ec2-user'
   rs = con.exec("SELECT * FROM bookmarks")
   
   bookmarks = []
   
   rs.each {|row| 
    bookmarks.push(row["url"])
   }
   return bookmarks
  end
end

