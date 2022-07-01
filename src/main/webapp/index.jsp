<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>efuluz</title>



<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>

	<header>
                <nav class="navbar navbar-expand-md navbar-dark" style="background-color: tomato">
                    <div>
                        <a href="#" class="navbar-brand"> E - Fuluz </a>
                    </div>

                    <ul class="navbar-nav">
                        <li> <a href="#" class="navbar-brand"> Welcome ${user.nom}  </a></li>
                    </ul>
                    <ul class="navbar-nav">
                        <li><a href="logout.jsp" class="btn btn-success">LogOut</a></li>
                    </ul>
                </nav>
     </header>
     
	<sql:setDataSource
        var="myDS"
        driver="com.mysql.jdbc.Driver"
        url="jdbc:mysql://localhost/efuluz"
        user="root" password=""
    />
     
    <sql:query var="users"   dataSource="${myDS}">
        SELECT * FROM user;
    </sql:query>
    
        <section class="main-page py-5">
        <div class="container">
            <div class="row h-100 justify-content-center align-items-center">
            
            	<div align="center">
				        <a href="createUser.jsp" class="btn btn-outline-success btn-lg me-5 rounded-0 merriweather" >Ajouter Un Compte</a>
				        <a href="trasnfertAdmin.jsp?id=<c:out value='${user.accNumber}' />" class="btn btn-outline-success btn-lg me-5 rounded-0 merriweather">Faire Un Transfert</a>
				        <a href="#" class="btn btn-outline-success btn-lg me-5 rounded-0 merriweather"  >HISTORIQUES </a><br>
			
    			</div>
    			
                <div class="col-lg-6 p-5">
                    <div align="center">
                    <caption><h2>Comptes Actives</h2></caption>
				        <table border="1" cellpadding="5">
				            <tr>
				                <th>Account Number</th>
				                <th>Name</th>
				                <th>Surname</th>
				                <th>Balance</th>
				                <th>Action</th>
				            </tr>
				            <c:forEach var="user" items="${users.rows}">
				                <tr>
				                    <td><c:out value="${user.accnumber}" /></td>
				                    <td><c:out value="${user.nom}" /></td>
				                    <td><c:out value="${user.prenom}" /></td>
				                    <td><c:out value="${user.balance}" /></td>
				                    <td><a href="modifyUser.jsp?id=<c:out value='${user.accnumber}' />">Edit</a>
				                     &nbsp;&nbsp;&nbsp;&nbsp; 
				                    <a href="delete.jsp?id=<c:out value='${user.accnumber}' />" > Delete</a></td>
				                    
				                </tr>
				            </c:forEach>
				        </table>
    				</div>
                </div>
                 
                <div class="col-lg-6">
                    <h1 class="p-5">Lorem ipsum dolor sit amet consectetur adipisicing elit. Molestiae sit ipsa </h1>
                    <p class="p-5"> Lorem ipsum dolor sit amet consectetur adipisicing elit. Molestiae sit ipsa optio
                        deleniti natus numquam labore minima assumenda, nesciunt modi voluptatibus laboriosam harum
                        dolorum ad illum eum blanditiis rem consectetur?
                        Lorem ipsum dolor sit amet consectetur, adipisicing elit. Accusamus aspernatur, dicta, molestias
                        consequatur error deleniti eligendi corrupti dolore quis dignissimos perferendis explicabo!
                        Minus pariatur, consequatur hic maiores dolor tempore esse.
                        Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nostrum quasi earum, error voluptas,
                        eveniet alias vitae illo voluptate hic quam exercitationem! A laboriosam tempore odit rerum eos
                        corporis sunt molestias.
                    </p>
                </div>
            </div>
        </div>
    </section>
	
</body>
</html>