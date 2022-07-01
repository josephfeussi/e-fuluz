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
                        <a href="#" class="navbar-brand"> Bienvenu sur notre plateforme  </a>
                    </li>
                    
                    
                </ul>

            </div>
        </div>
    </nav>
    
	<header>
                <nav class="navbar navbar-expand-md navbar-dark" style="background-color: tomato">
                   
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
    
    	<h1 class="p-5">Connectez vous a votre compte</h1>
    
        <section class="test">
        <div class="container">
            <form action="HomeServlet" method="post" autocomplete="off">
                <div class="row">
                    <div class="col-md-4">
                        <div class="mb-3">
                            <label for="3" class="form-label">Numero :</label>
                            <input type="number" name="tel" required class="form-control" id="3" placeholder="Numero">
                        </div>
                        <div class="mb-3">
                            <label for="3" class="form-label">Password :</label>
                            <input type="password" required name="pwd" class="form-control" id="3" placeholder="Password">
                        </div>
                        <p>
                        	<input type="submit" class="btn btn-outline-success btn-lg me-5 rounded-0 merriweather" id="3" name="Action" value="Se connecter" >
                        	<input type="reset" class="btn btn-outline-danger btn-lg me-5 rounded-0 merriweather" id="3" value="Reset">
                          	
                        </p>

                    </div>
                </div>
        	</form>
        </div>
        
    </section>
    
      <a href="index.jsp" class="nav-link">index page</a>
	
</body>
</html>