# class Song < ActiveRecord::Base
#   include Slugifiable
#   belongs_to :artist
#   belongs_to :genre
# end

class Song < ActiveRecord::Base
  include Slugifiable
  belongs_to :artist
  belongs_to :genre
end
