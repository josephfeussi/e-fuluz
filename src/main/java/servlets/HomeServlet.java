package servlets;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import sms.Sms;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Random;

import appDao.AppDao;
import appDao.TransDao;
import beans.Transaction;
import beans.User;

/**
 * Servlet implementation class HomeServlet
 */
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomeServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.getServletContext().getRequestDispatcher("/home.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if (request.getParameter("Action").equals("Se connecter")) {
		      PrintWriter printWriter = response.getWriter();
		      int accnumber = Integer.parseInt((request.getParameter("tel")));
		      String password = request.getParameter("pwd");
		      try {   
		      AppDao appdao = new AppDao();
		      String destPage = "";
		      
		      
		            User user = appdao.checkLogin(accnumber, password);
		            
		            System.out.println("This is " + user.getAccNumber() + user.getBalance() + user.getNom());
		            if(user.getIsadmin() == 1 ) {
						System.out.println(user.getIsadmin());
						System.out.println(user.getNom());
						HttpSession session = request.getSession();
					    session.setAttribute("user", user);
						destPage = "/index.jsp";
					}else{
						System.out.println(user.getIsadmin());
						System.out.println(user.getNom());
						HttpSession session = request.getSession();
					    session.setAttribute("user", user);
						destPage = "/welcomeUser.jsp"; 	
					}
		            
		            System.out.println(destPage);
				      this.getServletContext().getRequestDispatcher(destPage).forward(request, response);
				      printWriter.print("<br><h2>User added Successfully!!</h2>");
		             
		        } catch (SQLException ex) {
		            throw new ServletException(ex);
		        }
		    }
		if (request.getParameter("Action").equals("Ajouter Client")) {
		      PrintWriter printWriter = response.getWriter();
		      
		      User user = new User();
		      AppDao appdao = new AppDao();
		      
		      user.setNom((request.getParameter("nom")));
		      user.setPrenom((request.getParameter("prenom")));
		      user.setAccNumber(Integer.parseInt((request.getParameter("tel"))));
		      user.setPassword((request.getParameter("pwd")));
		    
		      try {
				appdao.addUser(user);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		      
		      //RequestDispatcher dispatcher = request.getRequestDispatcher("createUser.jsp");
		      //dispatcher.include(request, response);
		      this.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
		      printWriter.print("<br><h2>User added Successfully!!</h2>");
		    }
		    if (request.getParameter("Action").equals("Modify User")) {
		    	PrintWriter printWriter = response.getWriter();
		    	
		    	 User user = new User();
			     AppDao appdao = new AppDao();
			     
			     user.setNom((request.getParameter("nom")));
			      user.setPrenom((request.getParameter("prenom")));
			      user.setPassword((request.getParameter("pwd")));
			      user.setAccNumber(Integer.parseInt((request.getParameter("tel"))));
			      
			      System.out.println(request.getParameter("tel"));
			      try {
					appdao.updateUser(user);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				//	RequestDispatcher dispatcher = request.getRequestDispatcher("delete.jsp");
				  //    dispatcher.include(request, response);
				    //  printWriter.print("<br><h2>Error!!</h2>");
				}	      
			     RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
			     dispatcher.include(request, response);
			     printWriter.print("<br><h2>User Edited Successfully!!</h2>");
		    }
		    if (request.getParameter("Action").equals("Delete")) {
		    	PrintWriter printWriter = response.getWriter();
		    	
		    	String userId = request.getParameter("id");
		    	
		    	User user = new User();
			    AppDao appdao = new AppDao();
			     
			    System.out.println(userId);
			    System.out.println("Heelo");
			    try {
					appdao.deleteUser(Integer.parseInt(request.getParameter("id")));
				} catch (NumberFormatException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
		        dispatcher.include(request, response);
		        printWriter.print("<br><h2>Doctor Deleted Successfully!!</h2>");
		    }
		    if (request.getParameter("Action").equals("Transfer")) {
		    	PrintWriter printWriter = response.getWriter();
		    	Random rand = new Random();
		    	
		    	//String userId = request.getParameter("id");
		    	
		    	User user = new User();
		    	Transaction trans = new Transaction();
			    AppDao appdao = new AppDao();
			    AppDao appdaO2 = new AppDao(); 
			    TransDao transdao = new TransDao();
			    
			   String recepStr =  request.getParameter("recepnum");
			   int myAcc = Integer.parseInt((request.getParameter("mynum")));
			   int recepAcc = Integer.parseInt(recepStr);
			   int montant = Integer.parseInt((request.getParameter("amount")));
			   int transid = rand.nextInt(10000);
			   
			   String message = "vous avez recu la somme de "+ montant + " FCFA du numero "+ myAcc+ " ID Trans : " + transid  ; 
			   System.out.println("Hello World");
			   user.setBalance(montant);
			   System.out.println(user.getBalance());
			     
			   try {
					User testUser = appdaO2.checkBalance(myAcc);
					if (testUser.getBalance() == 0 || testUser.getBalance() < montant ) {
						RequestDispatcher dispatcher = request.getRequestDispatcher("error1.jsp");
				        dispatcher.include(request, response);
					}else {
						try {
					    	
					    	appdao.addMoney(recepAcc, montant);
					    	
					    	trans.setTransId(transid);
					    	trans.setAccNumber(myAcc);
					    	trans.setTranType("TRANSFERT");
					    	trans.setAmount(montant);
					    	
					    	Sms.sendMessage("+19108128967", "+237"+recepStr, message);
					    	System.out.println(message);
					    	transdao.storeTransert(trans);
					    	
					    	RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
					        dispatcher.include(request, response);
					       printWriter.print("<br><h2>Transfert Initier Avec Success!!</h2>");
					    	
						} catch (NumberFormatException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						
						
					}
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
		        
		    }
	}

}
