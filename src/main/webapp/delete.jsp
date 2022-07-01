<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %> 

<%@page import="appDao.AppDao,beans.User"%>  
  
<%  
String id =request.getParameter("id"); 
AppDao appdao = new AppDao();
int userId = Integer.parseInt(id);

appdao.deleteUser(userId);

response.sendRedirect("index.jsp"); 


%> 
