module Slugifiable
  def to_slug
    name.downcase.tr(' ', '-')
  end
end
