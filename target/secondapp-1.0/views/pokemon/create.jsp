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
    <title>Agregar Pokemon</title>
    <jsp:include page="../../layouts/head.jsp"/>
</head>
<body>
<%--        NV NAVBAR--%>
<div class="container">

    <div class="col text-end">
        <button type="button" data-bs-toggle="modal" data-bs-target="#createPokemon" class="btn btn-outline-primary btn-sm">
            AGREGAR</button>

    </div>
</div>
<!-- Modal -->
<div class="modal fade" id="createPokemon" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="staticBackdropLabel">Agregar Pokemon</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>


            <div class="modal-body">
                <form id="pokemon-form" class="needs-validation" action="/api/pokemon/save" method="post" enctype="multipart/form-data">
                    <div class="container-fuid">
                        <div class="form-group mb-3">
                            <div class="row">
                                <div class="col">
                                    <div class="form-floating">
                                        <input class="form-control" placeholder="i" name="name" id="name" type="text" required>
                                        <label for="name">Nombre</label>
                                        <div class="invalid-feedback is-invalid">
                                            Campo obligatorio
                                        </div>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="form-floating">
                                        <input class="form-control" placeholder="i" name="power" id="power" type="text"  required>
                                        <label for="power">Poder</label>
                                        <div class="invalid-feedback">Campo obligatorio</div>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="form-floating">
                                        <input class="form-control" placeholder="i" name="hp" id="hp" type="text" required>
                                        <label for="hp">HP</label>
                                        <div class="invalid-feedback">Campo obligatorio</div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group mb-3">
                            <div class="row">
                                <div class="col">
                                    <div class="form-floating">
                                        <input class="form-control" placeholder="i" name="weight" id="weight" type="text" required>
                                        <label for="weight">Peso</label>
                                        <div class="invalid-feedback">Campo obligatorio</div>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="form-floating">
                                        <input class="form-control" placeholder="i" name="height" id="height" type="text" required>
                                        <label for="height">Altura</label>
                                        <div class="invalid-feedback">Campo obligatorio</div>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="form-floating">
                                        <input class="form-control" placeholder="i" name="ps" id="ps" type="text" required>
                                        <label for="ps">Puntos de Experiencia</label>
                                        <div class="invalid-feedback">Campo obligatorio</div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group mb-3">
                            <div class="row">
                                <div class="col">
                                    <div class="form-floating">
                                        <input class="form-control" placeholder="i" name="abilities" id="abilities" type="text" required>
                                        <label for="abilities">Habilidades</label>
                                        <div class="invalid-feedback">Campo obligatorio</div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group mb-3">

                            <div class="row">
                                <div class="col">
                                    <select id="pokemonType" name="pokemonType" class="form-select" aria-label="Default select example" required>
                                        <option selected>Tipo de Pokemon</option>
                                        <s:forEach items="${types}" var="types">
                                            <option value="${types.id}">${types.description}</option>
                                        </s:forEach>

                                    </select>
                                    <div class="invalid-feedback">Campo obligatorio</div>

                                </div>
                            </div>

                        </div>

                        <div class="form-group mb-3">
                            <div class="row">
                                <div class="col">
                                    <select class="form-select" aria-label="Default select example" id="personId" name="personId" required>

                                        <option selected>Persona Que Pertenece Pokemon</option>
                                        <s:forEach items="${people}" var="people">
                                            <option value="${people.id}">${people.name} ${people.surname} ${people.lastname}</option>
                                        </s:forEach>

                                    </select>
                                    <div class="invalid-feedback">Campo obligatorio</div>

                                </div>

                            </div>

                        </div>

                        <div class="form-group mb-3">
                            <div class="row">
                                <div class="col">
                                    <input class="form-control" type="file" name="file" id="file" required>
                                    <label for="file">Archivo</label>
                                    <div class="invalid-feedback">Campo obligatorio</div>
                                </div>

                            </div>
                        </div>


                    </div>


                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                        <button type="submit" class="btn btn-primary">Agregar</button>
                    </div>


                </form>

            </div>
        </div>

    </div>



</div>

<jsp:include page="../../layouts/footer.jsp"/>

<script>
    (function (){
        const  form= document.getElementById("pokemon-form");
        form.addEventListener("submit", function (event) {
            if(!form.checkValidity()){
                event.preventDefault();
                event.stopPropagation();
            }
            form.classList.add("was-Validated");
        },false)
    })();

    /*
  const form = document.getElementById("pokemon-form");
  form.addEventListener("submit", function(event) {
     // event.preventDefault(); // Evitar el envío del formulario por defecto

      // Validar el formulario
      if (!form.checkValidity()) {
          event.stopPropagation();
          form.classList.add("was-validated");
          return;
      }

      var name = document.getElementById("name").value;
      var ps = document.getElementById("ps").value;
      var hp = document.getElementById("hp").value;
      var power = document.getElementById("power").value;
      var weight = document.getElementById("weight").value;
      var height = document.getElementById("height").value;
      var abilities = document.getElementById("abilities").value;
      var person = document.getElementById("personId").value;
const fileInput = document.getElementById("file");
      const file = fileInput.files[0];
      formData.append('file',file)

      console.log(file);
      var IMG = document.getElementById("file").value;
       */
      //  console.log('name'+name+'ps'+ps+'hp'+hp+'power'+power+'weight'+weight+'height'+height+'abi'+abilities+'´pe'+person+'typ'+type);
        // Obtener los datos del formulario


        // Realizar la solicitud AJAX
       /* fetch("/api/pokemon/save", {
            method: "POST",
            body: formData,
            contentType: false,  // Agrega esta línea
        })
            .then(response => response.json())
            .then(data => {
                // Mostrar mensaje de éxito o error
                if (data.result) {
                    alert("¡Éxito! Pokemon registrado correctamente.");
                } else {
                    alert("¡Error! Acción no realizada correctamente.");
                }
            })
            .catch(error => {
                console.error("Error:", error);
                alert("¡Error! Acción no realizada correctamente.");
            });*/

</script>
</body>
</html>
