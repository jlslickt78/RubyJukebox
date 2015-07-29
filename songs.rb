class Songs
  #stores specific information about the song
  attr_accessor :title, :artist, :album, :year, :comments, :length

  def initialize(title, artist, album, year, comments, length)
    @title = title
    @artist = artist
    @album =  album
    @year = year
    @comments = comments
    @length = length
  end

  def to_s
		tab = "\t"
		show_songs = "Title:#{title}" + tab +
				"Artist:#{artist}" + tab +
				"Album:#{album}" + tab +
				"Year:#{year}" + tab +
				"Comments:#{comments}" + tab +
				"Length:#{length}"
		return show_songs.to_s
  end
end