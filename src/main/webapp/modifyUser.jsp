
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

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
    
</head>
<body>

<%@page import="appDao.AppDao,beans.User"%>  
  
<%  
String id =request.getParameter("id");  
User user= AppDao.getUserById(Integer.parseInt(id));  
%> 

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
                            <a class="nav-link" href="retrait.html" hidden > Faire un Retrait</a>
                        </li>
                        <li class="nav-item pe-4 " hidden >
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

     
    <section class="test py-5">
        <div class="container">
            <form action="HomeServlet" method="post" autocomplete="off">
                <div class="row">
                    <div class="col-md-4">
                        <div class="mb-3">
                            <label for="1" class="form-label">Nom : </label>
                            <input type="text" name="nom" required class="form-control" id="1" placeholder="sman akouya">
                        </div>
                        <div class="mb-3">
                            <label for="2" class="form-label">Prenom : </label>
                            <input type="text" name="prenom" required class="form-control" id="2" placeholder="name@example.com">
                        </div>

                        <div class="mb-3">
                            <label for="3" class="form-label">New Password :</label>
                            <input type="password" name="pwd" required class="form-control" id="3" placeholder="Password">
                        </div>
                        
                         <div class="mb-3" hidden>
                            <label for="3" class="form-label" > Numero :</label>
                            <input type="number" name="tel" value="<%= user.getAccNumber()%>" class="form-control" id="3" placeholder="Numero">
                        </div>
                        
                        <p>
                        	<input type="submit" class="btn btn-outline-success btn-lg me-5 rounded-0 merriweather"  name="Action" value="Modify User" >
                        	<input type="reset" class="btn btn-outline-danger btn-lg me-5 rounded-0 merriweather" value="Reset">
                          	
                        </p>

                    </div>
                </div>
        	</form>
        </div>
        
    </section>
</body>
</html>
</head>
<body>

</body>
</html>