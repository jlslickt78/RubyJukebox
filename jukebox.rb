class Jukebox
	require_relative 'songs'
	#plays songs
	#add songs
	#updates songs
	#deletes songs

	def initialize
		@songs = Array.new
	end

	#load jukebox
	def load_jukebox(new_jukebox)
		song_file = File.open("songs.txt", "r")
		until song_file.eof?
			line = song_file.gets
			song_array = line.split("\t")
			new_jukebox.add_song(song_array[0].chomp, song_array[1].chomp, song_array[2].chomp, song_array[3].chomp, song_array[4].chomp, song_array[5].to_i)
		end
	end

	#show song by length
	def song_length(user_entry)
		msg = Array.new
		@songs.each do |song|
			if (user_entry != song.length)
				msg << song
			end
		end

		if (msg.empty?)
			msg = msg.to_s
			msg = "Sorry no songs with that length!"
		end
		return msg
	end

	#show songs by specific artist
	def play_artist(user_entry)
		msg = Array.new
		@songs.each do |song|
			if (user_entry == song.artist)
				msg << song
			end
		end

		if (msg.empty?)
			msg = msg.to_s
			msg = "That artist doesn't exist!"
		end

		return msg
	end

	#pass in a number, get the number from main program, then get index corresponding to number
	def play_song(song_title)
		msg = ""
		@songs.each do |song|
			if (song_title == song.title)
				msg = "Playing #{song}"
			elsif (msg == "")
				msg = "No music for you!"
			end

		end
		return msg
	end

	#add song
	def add_song(title, artist, album, year, comments, length)
		@songs << Songs.new(title, artist, album, year, comments, length)
	end

	#delete song
	def delete_song(song_title)
		msg = ""
		@songs.each do |song|
			if (song_title == song.title)
				@songs.delete(song)
				msg = "Song deleted!"
			else
				msg = "Sorry that song doesn't exist!"
			end
		end
		return msg
	end

	#update song
	def update_song(song_title, title, artist, album, year, comments, length)
		msg = ""
		@songs.each do |song|
			if (song_title == song.title)
				song.title = title
				song.artist = artist
				song.album = album
				song.year = year
				song.comments = comments
				song.length = length
				msg = "Song updated!".to_s
			else
				msg = "Sorry song doesn't exist"
			end
		end
		return msg
	end

	#write songs to file
	def write_file
		lines = nil
		File.open("songs.txt", "w+") do |song|
			@songs.each do |line|
				lines = song.write("#{line.title}\t#{line.artist}\t#{line.album}\t#{line.year}\t#{line.comments}\t#{line.length}\n")
			end
		end
		return lines
	end

	def to_s
		return @songs
	end

end