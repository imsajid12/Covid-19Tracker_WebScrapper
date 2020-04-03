package allkonnected;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.nodes.Node;
import org.jsoup.select.Elements;

import com.utilities.GetConnection;
/**
 * Servlet implementation class Servlet1
 */
public class Servlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
    

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		List<String> dataList = new ArrayList<>();
		RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
		
		//get data from searchtb
		String countryName = request.getParameter("tbSearchCountry");
		try {
			//out.println(getData("India"));
			
			 dataList = GetConnection.getData(countryName);
			 
			 if(countryName == "" || countryName == null || GetConnection.hasNumberInString(countryName)) {
				 response.sendRedirect("http://www.google.com");
				 
				 //out.println("Hello");
			 }
			 else {
				 if(dataList != null) {
					 	request.setAttribute("dataList", dataList); 
					 	rd.forward(request, response); 
					 }
			 }
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
	}


}
