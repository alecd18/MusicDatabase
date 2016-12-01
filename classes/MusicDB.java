package project1;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ResourceBundle;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.concurrent.TimeUnit;

/**
 *
 * An implementation of the MusicDB
 *
 */
public class MusicDB {
	
	private static Connection _conn = null;
	private static ResourceBundle _bundle;
	
	/**
	 *
	 * @param bundle - resource bundle that contains database connection information
	 * @return
	 */
	public String openDBConnection(String bundle) {
	 _bundle = ResourceBundle.getBundle(bundle);
	 return openDBConnection(
							 _bundle.getString("dbUser"),
							 _bundle.getString("dbPass"),
							 _bundle.getString("dbSID"),
							 _bundle.getString("dbHost"),
							 Integer.parseInt(_bundle.getString("dbPort"))
							 );
	}
	
	/**
	 * Open the database connection.
	 * @param dbUser
	 * @param dbPass
	 * @param dbSID
	 * @param dbHost
	 * @return
	 */
	public String openDBConnection(String dbUser, String dbPass, String dbSID, String dbHost, int port) {
		
		String res="";
		if (_conn != null) {
			closeDBConnection();
		}
  
		try {
			_conn = DBUtils.openDBConnection(dbUser, dbPass, dbSID, dbHost, port);
			res = DBUtils.testConnection(_conn);
		} catch (SQLException sqle) {
			sqle.printStackTrace(System.err);
		} catch (ClassNotFoundException cnfe) {
			cnfe.printStackTrace(System.err);
		}
		return res;
	}
	
	/**
	 * Close the database connection.
	 */
	public void closeDBConnection() {
		try {
			DBUtils.closeDBConnection(_conn);
			System.out.println("Closed a connection");
		} catch (SQLException sqle) {
			sqle.printStackTrace(System.err);
		}
	}
	
    
    public void addUser(String username) {
        try{
            DateFormat df = new SimpleDateFormat("YYYY-MM-DD");
            Date date = new Date();
            String formatDate = df.format(date);
            String query = "INSERT INTO users (username, date_joined) values('" + username + "', to_date('" + formatDate + "', 'YYYY-MM-DD'))";
            DBUtils.executeUpdate(_conn, query);
        }
        catch(SQLException sqle) {
            sqle.printStackTrace(System.err);
        }

    }
    
    public String addFavorites(String song, String user) {
        String result = "";
        
        String song_id = "";
        
        try {
            String query = "SELECT sid FROM songs WHERE title = '" + song + "'";
            Statement st = _conn.createStatement();
            ResultSet rs = st.executeQuery(query);
            
            while (rs.next()) {
                song_id = rs.getString("sid");
                
            }
            
            rs.close();
            st.close();

        }
        catch(SQLException sqle) {
            sqle.printStackTrace(System.err);
            result = sqle.toString();
        }
        
        try {
            String query = "INSERT INTO users_favorite_songs (username, song_id) VALUES ('" + user + "', " + song_id + ")";
            DBUtils.executeUpdate(_conn, query);
            result = "success";
        }
        catch(SQLException sqle) {
            sqle.printStackTrace(System.err);
            result = sqle.toString();
        }
        
        return result;
    }
	
	public ArrayList<String> listFavorites(String user) {
		ArrayList<String> songs = new ArrayList<String>();
		
		String query = "SELECT songs.title FROM songs, users_favorite_songs WHERE songs.sid = users_favorite_songs.song_id AND users_favorite_songs.username = '"+ user +"'";
		
		
		try{
			Statement st = _conn.createStatement();
			ResultSet rs = st.executeQuery(query);
			
			while (rs.next()) {
				String song = rs.getString("title");
				songs.add(song);
			}
			
			rs.close();
			st.close();
		}
		catch(SQLException sqle) {
			sqle.printStackTrace(System.err);
		}
		
		return songs;
	}

    
    public boolean userExists(String username) {
        boolean exists = false;
        
        try {
            int cnt = DBUtils.getIntFromDB(_conn, "SELECT COUNT(*) FROM users WHERE username = '" + username + "'");
            if (cnt > 0) {
                exists = true;
            }
        } catch (SQLException sqle) {
            sqle.printStackTrace(System.err);
        }
        
        return exists;
    }
    
    public ArrayList<String> getAllArtists() {
        ArrayList<String> artists = new ArrayList<String>();
        
        String query = "SELECT name FROM artists";
        try {
            Statement st = _conn.createStatement();
            ResultSet rs = st.executeQuery(query);
        
            while (rs.next()) {
                String artist = rs.getString("name");
                artists.add(artist);
            }
        
            rs.close();
            st.close();
        }
        catch(SQLException sqle) {
            sqle.printStackTrace(System.err);
        }
        return artists;
    }
    
    public ArrayList<String> getAllVenues() {
        ArrayList<String> venues = new ArrayList<String>();
        
        String query = "SELECT name FROM venues";
        
        try {
            Statement st = _conn.createStatement();
            ResultSet rs = st.executeQuery(query);
            
            while (rs.next()) {
                String venue = rs.getString("name");
                venues.add(venue);
            }
            
            rs.close();
            st.close();
        }
        catch(SQLException sqle) {
            sqle.printStackTrace(System.err);
        }
        return venues;
    }
    
    public ArrayList<String> getArtistSongs(String artist) {
        ArrayList<String> songs = new ArrayList<String>();
        
        String query = "SELECT songs.title FROM songs, artists_perform_songs WHERE songs.sid = artists_perform_songs.song_id AND artists_perform_songs.artist_name = '" + artist + "'";
        
        try{
            Statement st = _conn.createStatement();
            ResultSet rs = st.executeQuery(query);
            
            while (rs.next()) {
                String song = rs.getString("title");
                songs.add(song);
            }
            
            rs.close();
            st.close();
        }
        catch(SQLException sqle) {
            sqle.printStackTrace(System.err);
        }
        
        return songs;
    }
    
    public ArrayList<String> getConcerts(String venue) {
        ArrayList<String> concerts = new ArrayList<String>();
        
        String query = "SELECT artists_performed_at_venues.artist, artists_performed_at_venues.concert_date FROM artists_performed_at_venues, venues WHERE artists_performed_at_venues.venue_id = venues.vid AND venues.name = '" + venue + "'";
        
        try {
            Statement st = _conn.createStatement();
            ResultSet rs = st.executeQuery(query);
            
            while (rs.next()) {
                String artist = rs.getString("artist");
                java.sql.Date date = rs.getDate("concert_date");
                String concert = artist + " - " + date.toString();
                concerts.add(concert);
            }
            
            rs.close();
            st.close();
        }
        catch (SQLException sqle) {
            sqle.printStackTrace(System.err);
        }
        
        return concerts;
    }
	
	public ArrayList<String> getSearchSongs(String enteredSong) {
		ArrayList<String> songs = new ArrayList<String>();
		
		String query = "SELECT songs.title FROM songs WHERE UPPER(songs.title) LIKE '%" + enteredSong.toUpperCase() + "%'";
		
		try{
			Statement st = _conn.createStatement();
			ResultSet rs = st.executeQuery(query);
			
			while (rs.next()) {
				String song = rs.getString("title");
				songs.add(song);
			}
			
			rs.close();
			st.close();
		}
		catch(SQLException sqle) {
			sqle.printStackTrace(System.err);
		}
		
		return songs;
	}
	
    public String getMVLink(String song) {
        String query = "SELECT music_videos.video_link FROM songs, music_videos WHERE songs.sid = music_videos.sid AND songs.title = '" + song + "'";
        
        String MVLink = "";
        
        try {
            Statement st = _conn.createStatement();
            ResultSet rs = st.executeQuery(query);
            
            while (rs.next()) {
                MVLink = rs.getString("video_link");
            }
            
            rs.close();
            st.close();
        }
        catch (SQLException sqle) {
            sqle.printStackTrace(System.err);
        }
        
        return MVLink;
    }
    
    public String getSongInfo(String song) {
        String songInfoHTML = "";
        
		String artistHTML = getArtists(song);
		
		String writersHTML = getWriters(song);
        
        String infoHTML = getInfo(song);
        
        songInfoHTML = artistHTML + writersHTML + infoHTML;
        
        return songInfoHTML;
    }
	
	public String getArtists(String song) {
		ArrayList<String> artists = new ArrayList<String>();
		
		String writerQuery = "SELECT artists_perform_songs.artist_name FROM artists_perform_songs, songs WHERE artists_perform_songs.song_id = songs.sid AND songs.title = '" + song + "'";
		try {
			Statement st = _conn.createStatement();
			ResultSet rs = st.executeQuery(writerQuery);
			
			while (rs.next()) {
				String artist = rs.getString("artist_name");
				artists.add(artist);
			}
			rs.close();
			st.close();
		}
		catch (SQLException sqle) {
			sqle.printStackTrace(System.err);
		}
		
		String artistsHTML = "<h3>Artist</h3><ul>";
		for (int i = 0; i < artists.size(); i++) {
			artistsHTML = artistsHTML + "<li>" + artists.get(i) + "</li>";
		}
		artistsHTML = artistsHTML + "</ul>";
		
		return artistsHTML;
	}
	
    public String getWriters(String song) {
        ArrayList<String> writers = new ArrayList<String>();
		
        String writerQuery = "SELECT writers_write_songs.writer_name FROM writers_write_songs, songs WHERE writers_write_songs.song_id = songs.sid AND songs.title = '" + song + "'";
        try {
            Statement st = _conn.createStatement();
            ResultSet rs = st.executeQuery(writerQuery);
            
            while (rs.next()) {
                String writer = rs.getString("writer_name");
                writers.add(writer);
            }
            rs.close();
            st.close();
        }
        catch (SQLException sqle) {
            sqle.printStackTrace(System.err);
        }
        
        String writersHTML = "<h3>Writers</h3><ul>";
        for (int i = 0; i < writers.size(); i++) {
            writersHTML = writersHTML + "<li>" + writers.get(i) + "</li>";
        }
        writersHTML = writersHTML + "</ul>";
        
        return writersHTML;
    }

    public String getInfo(String song) {
        String album = getAlbum(song);
        
        String infoQuery = "SELECT songs.duration, songs.release_date, songs.genre FROM songs WHERE songs.title = '" + song + "'";
        String infoHTML = "";
        
        try {
            Statement st = _conn.createStatement();
            ResultSet rs = st.executeQuery(infoQuery);
            
            while (rs.next()) {
                String duration = rs.getString("duration");
                java.sql.Date date = rs.getDate("release_date");
                String genre = rs.getString("genre");
                
                int durationInt = Integer.parseInt(duration);
                long minutes = (long)TimeUnit.SECONDS.toMinutes(durationInt);
                long seconds = (long)TimeUnit.SECONDS.toSeconds(durationInt) - (TimeUnit.SECONDS.toMinutes(durationInt) * 60);
    
                infoHTML = "<h3>Info</h3><ul><li>Duration: " + minutes + ":" + seconds + " minutes</li>" + "<li>Release Date: " + date.toString() + "</li>" + "<li>Genre: " + genre + "</li>" + "<li>Album: " + album + "</li>" + "</ul>";
            }
            rs.close();
            st.close();
        }
        catch (SQLException sqle) {
            sqle.printStackTrace(System.err);
        }
        
        return infoHTML;
    }
    
    public String getAlbum(String song) {
        String query = "SELECT albums.title FROM songs, albums, songs_on_albums WHERE songs.sid = songs_on_albums.song_id AND songs_on_albums.album_id = albums.aid AND songs.title = '" + song + "'";
        String album = "";
        
        
        try {
            Statement st = _conn.createStatement();
            ResultSet rs = st.executeQuery(query);
            
            while (rs.next()) {
                album = rs.getString("title");
            }
        }
        catch(SQLException sqle) {
            sqle.printStackTrace(System.err);
        }
        
        return album;
    }
    
    public void deleteFavorite(String user, String song) {
        String query = "DELETE FROM users_favorite_songs ufs USING songs s WHERE ufs.song_id = s.sid AND ufs.username = '" + user + "' AND s.title = '" + song + "'";
        
        try {
            DBUtils.executeUpdate(_conn, query);
        }
        catch (SQLException sqle) {
            sqle.printStackTrace(System.err);
        }
    }
    
	public static void main (String args[]) {
		
		if (args.length != 1) {
			System.out.println("Not enough arguments: Registrar bundle");
		}
		
		MusicDB mdb = new MusicDB();
		try {
	  
			String response = mdb.openDBConnection(args[0].trim());
	  
			System.out.println(response);
		} catch (RuntimeException rte) {
			rte.printStackTrace();
		} finally {
			mdb.closeDBConnection();
		}
		
	}
}
