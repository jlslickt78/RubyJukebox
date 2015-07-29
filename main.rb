require_relative 'jukebox'

def menu
	puts "1. Show all songs that are longer than a user entered value"
	puts "2. Show All songs that were written by a specific author"
	puts "3. Play a specific song"
	puts "4. Add a new song to the jukebox from user input"
	puts "5. Delete a song from the jukebox"
	puts "6. Update a song in the jukebox"
	puts "7. Show all songs in the jukebox"
	puts "8. Quit"
	print "Enter your selection:"
	puts
	return gets.chomp.to_i
end

#instaniate new jukebox object
#load jukebox with songs
new_jukebox = Jukebox.new
new_jukebox.load_jukebox(new_jukebox)

while (user_selection = menu) != 8
	puts "You selected: #{user_selection}"

	if (user_selection == 1)
		puts "Please enter a numeric value"
		user_entry = gets.chomp.to_i

		puts new_jukebox.song_length(user_entry)
		puts

	elsif (user_selection == 2)
		puts "Please enter the artist you would want to look for:"
		user_entry = gets.chomp.to_s

		puts new_jukebox.play_artist(user_entry)
		puts

		#have the user select a song by number
	elsif (user_selection == 3)
		puts "Which song would you like to play?"
		puts new_jukebox.to_s
		puts

		print "Please enter the title:"
		song_title = gets.chomp.to_s

		puts new_jukebox.play_song(song_title)
		puts

	elsif (user_selection == 4)
		puts "Please enter the following."
		puts "Title:"
		title = gets.chomp
		puts "Artist:"
		artist = gets.chomp
		puts "Album:"
		album = gets.chomp
		puts "Year:"
		year = gets.chomp
		puts "Comments:"
		comments = gets.chomp
		puts "Length:"
		length = gets.chomp

		new_jukebox.add_song(title, artist, album, year, comments, length)

	elsif (user_selection == 5)
		puts "Which song would you like to delete?"
		puts new_jukebox.to_s

		print "Please enter the title:"
		song_title = gets.chomp.to_s

		puts new_jukebox.delete_song(song_title)
		puts
		puts new_jukebox.to_s
		puts

	elsif (user_selection == 6)
		puts "Which song would you like to update?"
		puts new_jukebox.to_s
		puts

		print "Please enter the title to update:"
		song_title = gets.chomp.to_s


		puts "Enter a new title:"
		title = gets.chomp.to_s

		puts "Enter the artist:"
		artist = gets.chomp.to_s

		puts "Enter the album:"
		album = gets.chomp.to_s

		puts "Enter the year:"
		year = gets.chomp.to_s

		puts "Enter a comment:"
		comments = gets.chomp.to_s

		puts "Enter the length:"
		length = gets.chomp.to_i

		new_jukebox.update_song(song_title, title, artist, album, year, comments, length)
		puts
		puts new_jukebox.to_s
		puts

	elsif (user_selection == 7)
		puts new_jukebox.to_s
		puts
	end
end
if user_selection == 8
	#write to file on close
	new_jukebox.write_file
end
