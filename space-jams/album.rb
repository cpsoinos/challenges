require 'pry'

class Album
  def initialize(album_id, album_title, album_artists)
    @album_id = album_id
    @album_title = album_title
    @album_artists = album_artists
    @tracks = Array.new
  end

  def id
    @album_id
  end

  def title
    @album_title
  end

  def artists
    @album_artists
  end

  def tracks
    @tracks
  end

  def track_list
    @track_list = ""
    tracks.each do |track|
      @track_list += "\t- #{track[:title]}\n"
    end
    @track_list
  end

  def duration
    @duration_album = 0.to_f
    tracks.each do |track|
      @duration_album += (track[:duration_ms].to_f)
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
