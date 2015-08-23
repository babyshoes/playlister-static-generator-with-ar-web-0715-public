class SiteGenerator
  attr_reader :rendered_path

  def generate
    build_index; build_artists_index; build_artist_page; build_genres_index;
    build_genre_page; build_songs_index; build_song_page
  end

  def initialize(rendered_path)
    @rendered_path = rendered_path
    FileUtils.mkdir_p(rendered_path) unless File.exist? rendered_path
    FileUtils.mkdir_p("#{rendered_path}/artists") unless File.exist? "#{rendered_path}/artists"
    FileUtils.mkdir_p("#{rendered_path}/genres") unless File.exist? "#{rendered_path}/genres"
    FileUtils.mkdir_p("#{rendered_path}/songs") unless File.exist? "#{rendered_path}/songs"
  end

  def build_index
    # binding.pry
    template = File.read('app/views/index.html.erb')
    File.open("#{rendered_path}/index.html", 'w') do |f|
      f.write ERB.new(template).result(binding)
    end

  end

  def build_artists_index
    template = File.read('app/views/artists/index.html.erb')
    File.open("#{rendered_path}/artists/index.html", "w+") do |f|
      f.write ERB.new(template).result(binding)
    end
  end

  def build_artist_page
    Artist.all.each do |artist|
      @artist = artist
      template = File.read('app/views/artists/show.html.erb')
      File.open("#{rendered_path}/artists/#{artist.to_slug}.html", "w+") do |f|
        f.write ERB.new(template).result(binding)
      end
    end
  end

  def build_genres_index
    template = File.read('app/views/genres/index.html.erb')
    File.open("#{rendered_path}/genres/index.html", "w+") do |f|
      f.write ERB.new(template).result(binding)
    end
  end

  def build_genre_page
    Genre.all.each do |genre|
      @genre = genre
      template = File.read('app/views/genres/show.html.erb')
      File.open("#{rendered_path}/genres/#{genre.to_slug}.html", "w+") do |f|
        f.write ERB.new(template).result(binding)
      end
    end
  end

  def build_songs_index
    template = File.read('app/views/songs/index.html.erb')
    File.open("#{rendered_path}/songs/index.html", 'w+') do |f|
      f.write ERB.new(template).result(binding)
    end
  end

  def build_song_page
    Song.all.each do |song|
      @song = song
      template = File.read('app/views/songs/show.html.erb')
      File.open("#{rendered_path}/songs/#{song.to_slug}.html", 'w+') do |f|
        f.write ERB.new(template).result(binding)
      end
    end
  end


end
