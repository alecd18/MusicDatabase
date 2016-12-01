package project1;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.net.URLDecoder;



public class MusicServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private MusicDB _mdb;
	private String _message;
	
	public void init() throws ServletException {
		_mdb = new MusicDB();
		_message = _mdb.openDBConnection("PgBundle");
	}
	
	public void printSongs(PrintWriter out) {
		
		out.println("<h1>Music Database</h1>");
		
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
        
        String function = "";
        String[] parameters = URLDecoder.decode(request.getQueryString(), "UTF-8").split("&");
        if (parameters.length > 0) {
            String firstPair = parameters[0];
            String[] nameValue = firstPair.split("=");
            function = nameValue[1];
        }
        
        if (function.equals("getArtists")) {
            getArtists(response);
        }
        else if (function.equals("getArtistsSongs")) {
            getArtistsSongs(parameters, response);
        }
		else if (function.equals("getSearchSongs")) {
			getSearchSongs(parameters, response);
		}
        else if (function.equals("getMV")) {
            getMV(parameters, response);
        }
        else if (function.equals("addFavorites")) {
            addFavorites(parameters, response);
        }
		else if (function.equals("listFavorites")) {
			listFavorites(parameters, response);
		}
        else if (function.equals("getVenues")) {
            getVenues(response);
        }
        else if (function.equals("getConcerts")) {
            getConcerts(parameters, response);
        }
        else if (function.equals("getSongInfo")) {
            getSongInfo(parameters, response);
        }
        else if (function.equals("removeFavorite")) {
            removeFavorite(parameters, response);
        }
	}
	
    public void getArtists(HttpServletResponse response) throws ServletException, IOException {
        ArrayList<String> artists = _mdb.getAllArtists();
        
        response.setHeader("Content-Type", "text/plain");
        response.setHeader("success", "yes");
        PrintWriter writer = response.getWriter();
        for (int i = 0; i < artists.size(); i++) {
            writer.write(artists.get(i) + ":");
        }
        writer.close();
    }
    
    public void getVenues(HttpServletResponse response) throws ServletException, IOException {
        ArrayList<String> venues = _mdb.getAllVenues();
        
        response.setHeader("Content-Type", "text/plain");
        response.setHeader("success", "yes");
        PrintWriter writer = response.getWriter();
        for (int i = 0; i < venues.size(); i++) {
            writer.write(venues.get(i) + ":");
        }
        writer.close();
    }
    
    public void getArtistsSongs(String[] parameters, HttpServletResponse response) throws ServletException, IOException {
        String artistPair = parameters[1];
        String[] nameValue = artistPair.split("=");
        String artist = nameValue[1];
        
        ArrayList<String> songs = _mdb.getArtistSongs(artist);
        response.setHeader("Content-Type", "text/plain");
        response.setHeader("success", "yes");
        PrintWriter writer = response.getWriter();
        for (int i = 0; i < songs.size(); i++) {
            writer.write(songs.get(i) + ":");
        }
        writer.close();
    }
    
    public void getConcerts(String[] parameters, HttpServletResponse response) throws ServletException, IOException {
        String venuePair = parameters[1];
        String[] nameValue = venuePair.split("=");
        String venue = nameValue[1];
        venue = venue.replace("ampersand", "&");
        
        ArrayList<String> concerts = _mdb.getConcerts(venue);
        response.setHeader("Content-Type", "text/plain");
        response.setHeader("success", "yes");
        PrintWriter writer = response.getWriter();
        for (int i = 0; i < concerts.size(); i++) {
            writer.write(concerts.get(i) + ":");
        }
        writer.close();
    }
	
	public void getSearchSongs(String[] parameters, HttpServletResponse response) throws ServletException, IOException {
		String songPair = parameters[1];
		String[] nameValue = songPair.split("=");
		String song = nameValue[1];
		
		ArrayList<String> songs = _mdb.getSearchSongs(song);
		response.setHeader("Content-Type", "text/plain");
		response.setHeader("success", "yes");
		PrintWriter writer = response.getWriter();
		for (int i = 0; i < songs.size(); i++) {
			writer.write(songs.get(i) + ":");
		}
		writer.close();
	}
	
    public void getMV(String[] parameters, HttpServletResponse response) throws ServletException, IOException {
        String songPair = parameters[1];
        String[] nameValue = songPair.split("=");
        String song = nameValue[1];
        
        String link = _mdb.getMVLink(song);
        response.setHeader("Content-Type", "text/plain");
        response.setHeader("success", "yes");
        PrintWriter writer = response.getWriter();
        writer.write(link);
        writer.close();
    }
    
    public void addFavorites(String[] parameters, HttpServletResponse response) throws ServletException, IOException {
        String songPair = parameters[1];
        String[] nameValue = songPair.split("=");
        String song = nameValue[1];
        
        String userPair = parameters[2];
        String[] usernameValue = userPair.split("=");
        String user = usernameValue[1];
        
        String result = _mdb.addFavorites(song, user);
        
        response.setHeader("Content-Type", "text/plain");
        response.setHeader("success", "yes");
        PrintWriter writer = response.getWriter();
        writer.write(result);
        writer.close();
    }
	
	public void listFavorites(String[] parameters, HttpServletResponse response) throws ServletException, IOException {
		String userPair = parameters[1];
		String[] nameValue = userPair.split("=");
		String user = nameValue[1];
		
		ArrayList<String> songs = _mdb.listFavorites(user);
		response.setHeader("Content-Type", "text/plain");
		response.setHeader("success", "yes");
		PrintWriter writer = response.getWriter();
		for (int i = 0; i < songs.size(); i++) {
			writer.write(songs.get(i) + ":");
		}
		writer.close();
	}
    
    public void getSongInfo(String[] parameters, HttpServletResponse response) throws ServletException, IOException {
        String songPair = parameters[1];
        String[] nameValue = songPair.split("=");
        String song = nameValue[1];
        
        String songInfoHTML = _mdb.getSongInfo(song);
        response.setHeader("Content-Type", "text/plain");
        response.setHeader("success", "yes");
        PrintWriter writer = response.getWriter();
        writer.write(songInfoHTML);
        writer.close();

    }
    
    public void removeFavorite(String[] parameters, HttpServletResponse response) throws ServletException, IOException {
        String songPair = parameters[1];
        String[] nameValue = songPair.split("=");
        String song = nameValue[1];
        
        String userPair = parameters[2];
        String[] usernameValue = userPair.split("=");
        String user = usernameValue[1];
        
        _mdb.deleteFavorite(user, song);
    }

	
	public void doPost(HttpServletRequest inRequest, HttpServletResponse outResponse)
	throws ServletException, IOException {
		
		doGet(inRequest, outResponse);
	}
	
	public void destroy() {
		_mdb.closeDBConnection();
	}
}

