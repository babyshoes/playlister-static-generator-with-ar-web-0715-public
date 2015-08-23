# class Genre < ActiveRecord::Base
#   include Slugifiable
#   has_many :songs
#   has_many :artists, through: :songs
# end

class Genre < ActiveRecord::Base
  include Slugifiable
  has_many :songs
  has_many :artists, through: :songs
end
