<%--
  Created by IntelliJ IDEA.
  User: ChrisALe
  Date: 28/06/2023
  Time: 10:36 a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Pokemon</title>
    <jsp:include page="../../layouts/head.jsp"/>
</head>
<body>
<%--        NV NAVBAR--%>
<div class="container">

    <div class="row">
        <div class="col">
            <br>
            <a class="navbar-brand mb-sm-5"  href="#">
                <img src="../../assets/img/pokebola.png"  alt="bootstrap" width="35" height="35"  >
                POKEMONS
            </a>
            <br><br>

            <div class="card">
                <div class="card-header">
                    <div class="row">

                            <jsp:include page="create.jsp"/>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <div class="container-fluid">
                        <div class="form-group mb-3">
                            <div class="row">
                                <s:forEach items="${pokemons}" var="pokemons" >

                                    <div class="col" >
                                        <div class="card" style="width: 18rem;">
                                                <%--    <img src="/pokemon/loadfile?file=${pokemons.id}" class="card-img-top" alt="${pokemons.name}">--%>
                                       <img src="../../assets/img/charizard.gif" class="card-img-top" alt="${pokemons.name}">
                                     <div class="card-body">
                                         <h5 class="card-title">${pokemons.name}</h5>
                                         <p class="card-text">Poder: ${pokemons.power}</p>
                                         <p class="card-text">Puntos de experiencia: ${pokemons.ps}</p>
                                         <p class="card-text">Puntos de salud: ${pokemons.hp}</p>
                                         <p class="card-text">Habilidades: ${pokemons.abilities}</p>
                                         <button type="button" class="btn btn-primary">
                                             <i data-feather="edit"></i>EDITAR
                                         </button>
                                     </div>
                                 </div>
                                 <br><br>
                             </div>
                             <br><br><br><br>
                         </s:forEach>

                     </div>
                 </div>

             </div>


         </div>
     </div>
 </div>
</div>
</div>


</body>
</html>