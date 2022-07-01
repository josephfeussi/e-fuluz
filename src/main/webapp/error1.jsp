<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
                        <li class="nav-item pe-4 " hidden>
                        	<a href="transfertMoney.jsp?id=<c:out value='${user.accNumber}' />" class="nav-link">Faire Un Transfert</a>
                        </li>

                        <li class="nav-item pe-4 ">
                            <a class="nav-link" href="#">Faire un Retrait</a>
                        </li>
                        <li class="nav-item pe-4 ">
                            <a class="nav-link" href="  #">Information du compte</a>
                        </li>
                        <li class="nav-item pe-4 ">
                            <a class="btn btn-order rounded-0" href="#">Information Client</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>


    </section>

     
     <h1 class="p-5">Votre Solde est insuffisant </h1>
     
</body>
</html>