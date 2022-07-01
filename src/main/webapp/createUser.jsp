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

</head>
<body>
	<header>
                <nav class="navbar navbar-expand-md navbar-dark" style="background-color: tomato">
                    <div>
                        <a href="#" class="navbar-brand"> Gestion Etudiant </a>
                    </div>

                    <ul class="navbar-nav">
                        <li><a href="<%=request.getContextPath()%>/list" class="nav-link">Students</a></li>
                    </ul>
                </nav>
     </header>
     
    <section class="test py-5">
        <div class="container">
            <form action="HomeServlet" method="post" autocomplete="off">
                <div class="row">
                    <div class="col-md-4">
                        <div class="mb-3">
                            <label for="1" class="form-label">Nom : </label>
                            <input type="text" name="nom" class="form-control" id="1" placeholder="sman akouya">
                        </div>
                        <div class="mb-3">
                            <label for="2" class="form-label">Prenom : </label>
                            <input type="text" name="prenom" class="form-control" id="2" placeholder="name@example.com">
                        </div>
                        <div class="mb-3">
                            <label for="3" class="form-label">Numero :</label>
                            <input type="number" name="tel" class="form-control" id="3" placeholder="Numero">
                        </div>
                        <div class="mb-3">
                            <label for="3" class="form-label">Password :</label>
                            <input type="password" name="pwd" class="form-control" id="3" placeholder="Password">
                        </div>
                        <div class="mb-3">
                            <label for="3" class="form-label">Validé Password :</label>
                            <input type="password" class="form-control" id="3" placeholder="Password">
                        </div>
                        <p>
                        	<input type="submit" class="btn btn-outline-success btn-lg me-5 rounded-0 merriweather" id="3" name="Action" value="Ajouter Client" >
                        	<input type="reset" class="btn btn-outline-danger btn-lg me-5 rounded-0 merriweather" id="3" value="Reset">
                          	
                        </p>

                    </div>
                </div>
        	</form>
        </div>
        
    </section>
</body>
</html>