<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>efuluz</title>

	<style>
	


        .main-page {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .header {
            background-color: tomato;
            color: #fff;
        }
    </style>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
     
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container">
            <a class="navbar-brand" href="#">E-FULUZ</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a href="#" class="navbar-brand"> Welcome ${user.nom}  </a>
                    </li>
                    <li class="nav-item">
                         <li><a href="logout.jsp" class="btn btn-success" >Se deconnecter</a></li>
                    </li>
                </ul>

            </div>
        </div>
    </nav>


    <section class="header text-center p-5 ">

        <nav class="cc-navbar navbar navbar-expand-lg navbar-dark">
            <div class=".container-xxl">
                <!-- <a class="navbar-brand text-uppercase fw-bolder mx-4 py-3" href="#">Restaurant </a> -->
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-lg-0">
                        <li class="nav-item pe-4 ">
                            <a class="nav-link active" aria-current="page" href="welcomeUser.jsp">Acceuil</a>
                        </li>
                        <li class="nav-item pe-4 ">
                        	<a href="transfertMoney.jsp?id=<c:out value='${user.accNumber}' />" class="nav-link">Faire Un Transfert</a>
                        </li>

                        <li class="nav-item pe-4 ">
                            <a class="nav-link" href="retrait.html" hidden >Faire un Retrait</a>
                        </li>
                        <li class="nav-item pe-4 ">
                            <a href="modifyUser.jsp?id=<c:out value='${user.accNumber}' />"> Information du Client</a>
                        </li>
                        <li class="nav-item pe-4 ">
                            <a class="btn btn-order rounded-0" href="information.html">Historique</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>


    </section>
	
	<sql:setDataSource
        var="myDS"
        driver="com.mysql.jdbc.Driver"
        url="jdbc:mysql://localhost/efuluz"
        user="root" password=""
    />
     
    <sql:query var="users"   dataSource="${myDS}">
        SELECT * FROM user;
    </sql:query>
    
	<% 
request.getSession(false);
if (session == null) { %>
  <a href="home.jsp"> Home</a>
  <a href="login.jsp"> Login</a>
  <% 
} else {
    // Already created.
    %>
  
  <div class="card border-info mb-3 container d-flex align-items-center justify-content-center" style="max-width: 18rem;">
			<div class="card-header">SOLDE</div>
			<div class="card-body">
    		<h5 class="card-title"> ${user.balance}</h5>
    
  	</div>
  <% 
}
String name = request.getParameter("name");
%>
<br><br>
<%

%>


	
</body>
</html>