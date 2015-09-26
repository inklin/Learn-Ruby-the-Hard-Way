class Song
  attr_reader :lyrics, :singer

  def initialize(lyrics, singer)
    @lyrics = lyrics
    @singer = singer
  end

  def sing_me_a_song()
    @lyrics.each { |line| puts line}
  end

  def define_singer()
    puts "The singer of this song is #{@singer}"
  end

  def get_line(line_number)
    line = @lyrics[line_number-1]
    puts "Lyric #{line_number} is #{line}"
  end

  def print_array()
    puts @lyrics
  end
end

happy_bday = Song.new(["Happy birthday to you",
  "I don't want to get sued",
  "So I'll stop right there"], "Everyone")

happy_bday.sing_me_a_song()

another_day_in_paradise = Song.new(["Oh think twice, it's another day for you \
and me in paradise",
  "Oh think twice, 'cause it's just another day for you",
  "You and me in paradise, think about it"], "Phil Collins")

another_day_in_paradise.sing_me_a_song()


bulls_on_parade = Song.new(["They rally around tha family",
  "With pockets full of shells"], "Rage Against the Machine")

bulls_on_parade.define_singer()
bulls_on_parade.get_line(2)
puts "The lyrics of Bulls on Parade are:"
puts bulls_on_parade.lyrics
