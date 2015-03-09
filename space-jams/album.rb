require 'pry'

class Album
  def initialize(album_id, album_title, album_artists)
    @id = album_id
    @title = album_title
    @artists = album_artists
    @tracks = Array.new
  end

  attr_accessor :id, :title, :artists, :tracks

  def track_list
    @track_list = ""
    tracks.each do |track|
      @track_list += "\t- #{track.title}\n"
    end
    @track_list
  end

  def duration
    @duration_album = 0.to_f
    tracks.each do |track|
      @duration_album += (track.duration_ms.to_f)
    end
    Time.at(@duration_album / 1000).strftime("%M:%S")
  end

  def summary
    <<-summary
    \tName: #{@album_title}
    \tArtist(s): #{@album_artists}
    \tDuration (min): #{duration}
    \tTracks:
    #{track_list}

    summary
  end
end

class Track
  def initialize(album_id, track_id, title, track_number, duration_ms, album_title, album_artists)
    @album_id = album_id
    @track_id = track_id
    @title = title
    @track_number = track_number
    @duration_ms = duration_ms
    @album_title = album_title
    @artists = album_artists
  end

  attr_accessor :album_id, :track_id, :title, :track_number, :duration_ms, :album_title, :artists
end
