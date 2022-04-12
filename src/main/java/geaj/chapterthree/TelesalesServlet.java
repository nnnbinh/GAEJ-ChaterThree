package geaj.chapterthree;

import java.io.IOException; 
import javax.servlet.http.*;

import java.util.ArrayList;
import java.util.Date; 
import java.util.List; 
import java.text.DateFormat; 
import javax.servlet.*; 
import javax.jdo.PersistenceManager; 

import geaj.chapterthree.entity.*;

import com.google.appengine.api.datastore.Key; 
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.EntityNotFoundException;
import com.google.appengine.api.datastore.FetchOptions;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Query;
import com.google.cloud.datastore.StructuredQuery.PropertyFilter;

@SuppressWarnings("serial")
public class TelesalesServlet extends HttpServlet{
	@SuppressWarnings("deprecation")
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
		// create the persistence manager instance
//		PersistenceManager pm = PMF.get().getPersistenceManager();
		DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
		
		// display the lookup form 
		if(request.getParameter("action").equals("accountLookup")) {
			 // query for the entities by name 
			Query q = new Query("Account");
			q.setFilter(new Query.FilterPredicate("name", Query.FilterOperator.EQUAL, request.getParameter("accountName")));
			List<Entity> accounts = new ArrayList<Entity>();
			PreparedQuery pq = ds.prepare(q);
			
			pq.asIterable().forEach(accounts::add);
			// pass the list to the jsp 
			request.setAttribute("accounts", accounts);
			// forward the request to the jsp 
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/accountLookup.jsp"); 
			dispatcher.forward(request, response);
			// display the create new account form 
		} else if(request.getParameter("action").equals("accountCreate")) { 
			response.sendRedirect("/accountCreate.jsp"); 
			// process the new account creation and send the user to the account display page 
		} else if(request.getParameter("action").equals("accountCreateDo")) { 
			// create the new account 
			Entity account = new Entity("Account");
			
			account.setProperty("name", request.getParameter("name"));
			account.setProperty("city", request.getParameter("billingCity"));
			account.setProperty("state", request.getParameter("billingState"));
			account.setProperty("phone",request.getParameter("phone"));
			account.setProperty("website", request.getParameter("website"));
			
			ds.put(account);
		 	response.sendRedirect("telesales?action=accountDisplay&accountId="+account.getKey().getId()); 
		 // display the account details and opportunities 
		} 
		 	else if(request.getParameter("action").equals("accountDisplay")) { 
			// fetch the account 
			Key k = KeyFactory.createKey(Account.class.getSimpleName(), Long.parseLong(request.getParameter("accountId"))); 
			Entity account;
			try {
				account = ds.get(k);
			} catch (EntityNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				account=null;
			}
			
			// query for the opportunities
			Query q2 = new Query("Opportunity");
			q2.setFilter(new Query.FilterPredicate("accountId", Query.FilterOperator.EQUAL, request.getParameter("accountId")));
			List<Entity> opportunities = new ArrayList<Entity>();
			PreparedQuery pq2 = ds.prepare(q2);
			
			pq2.asIterable().forEach(opportunities::add);
			// pass the list to the jsp 
			request.setAttribute("account", account); 
			// pass the list to the jsp 
			request.setAttribute("opportunities", opportunities); 
		  
			// forward the request to the jsp 
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/accountDisplay.jsp"); 
			dispatcher.forward(request, response); 
				  
			//display the create new opportunity form 
		} 
		else if(request.getParameter("action").equals("opportunityCreate")) { 
			Key k = KeyFactory.createKey(Account.class.getSimpleName(), Long.parseLong(request.getParameter("accountId"))); 
			Entity account;
			try {
				account = ds.get(k);
			} catch (EntityNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				account=null;
			}
			// pass the account name to the jsp 
			request.setAttribute("accountName", account.getProperty("name")); 
			// forward the request to the jsp 
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/opportunityCreate.jsp"); 
			dispatcher.forward(request, response); 
			// process the new opportunity creation and send the user to the account display page 
		} 
			else if(request.getParameter("action").equals("opportunityCreateDo")) { 
			Date closeDate = new Date(); 
			// try to parse the date 
			try { 
				DateFormat df = DateFormat.getDateInstance(3);
				closeDate = df.parse(request.getParameter("closeDate")); 
			} catch(java.text.ParseException pe) { 
				System.out.println("Exception " + pe); 
			} 
			Entity opportunity = new Entity("Opportunity");
			opportunity.setProperty("name", request.getParameter("name"));
			opportunity.setProperty("amount", request.getParameter("amount"));
			opportunity.setProperty("stageName", request.getParameter("stageName"));
			opportunity.setProperty("probability", request.getParameter("probability"));
			opportunity.setProperty("orderNumber", request.getParameter("orderNumber"));
			opportunity.setProperty("closeDate", closeDate);
			opportunity.setProperty("accountId", request.getParameter("accountId"));
			// persist the entity 

			ds.put(opportunity);
			response.sendRedirect("telesales?action=accountDisplay&accountId="+request.getParameter("accountId")); 
		} 
  } 
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
		doGet(request, response); 
  } 
				  
}
