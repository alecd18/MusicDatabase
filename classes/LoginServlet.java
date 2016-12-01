package project1;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
    private MusicDB mdb;
    private String _message;
    
    public void init() throws ServletException {
        mdb = new MusicDB();
        _message = mdb.openDBConnection("PgBundle");
    }
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		
		String message = "";
		String username = "";
		String[] parameters = URLDecoder.decode(request.getQueryString(), "UTF-8").split("&");
		if (parameters.length > 0) {
		    String firstPair = parameters[0];
		    String[] nameValue = firstPair.split("=");
		    username = nameValue[1];
            if (!mdb.userExists(username)) {
                mdb.addUser(username);
					 message = "Thank you for registering with us, " + username + "!";
            }
				else{
					message = "Welcome back, " + username + "!";
				}
		}
		
		response.setHeader("Content-Type", "text/plain");
	    response.setHeader("success", "yes");
	    PrintWriter writer = response.getWriter();
	    writer.write(message);
	    writer.close();
	    
	}
			
	public void doPost(HttpServletRequest inRequest, HttpServletResponse outResponse)
	throws ServletException, IOException {
				
		doGet(inRequest, outResponse);
	}
	
	
	
}
