class MusicLibraryController
  def initialize(path = './db/mp3s')
    MusicImporter.new(path).import
  end

  def call
    puts "Welcome to your music library!"

    input = ""

    until input == 'exit'
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"

      input = gets.strip.downcase
      case input
      when 'list songs'
        list_songs
      when 'list artists'
        list_artists
      when 'list genres'
        list_genres
      else
        puts "Please enter a valid command."
      end
    end
  end

  def list_songs
    Song.all.each { |song| puts song.name }
  end

  def list_artists
    Artist.all.each { |artist| puts artist.name }
  end

  def list_genres
    Genre.all.each { |genre| puts genre.name }
  end

  def list_artist(artist)
    artist.songs.each { |song| puts song.name }
  end

  def list_genre(genre)
    genre.songs.each { |genre| puts genre.name }
  end

end
