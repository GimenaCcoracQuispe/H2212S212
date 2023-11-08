<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<!-- Favicon -->
<link rel="icon" type="image/png" href="img/Claro.svg.png">

<title>CLARO</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
	crossorigin="anonymous"></script>
</head>

<body>

	<div class="container-fluid p-0">

		<div class="row">

			<!-- MENU LATERAL -->
			<div class="col">
				<jsp:include page="menu.jsp"></jsp:include>
			</div>
			
			
			<!-- MENU SUPERIOR DE HORA -->
			<nav
				class="navbar navbar-expand-lg navbar-danger bg-danger navbar-with-datetime">
				<div class="container-fluid">
					<div
						class="d-flex justify-content-center align-items-center flex-grow-1">
						<span id="currentDateTime"
							class="nav-link text-white text-center w-100"> <span
							id="currentTime" style="font-size: 34px;"></span> - <span
							id="currentDate"></span>
						</span>
					</div>
					<button class="navbar-toggler" type="button"
						data-bs-toggle="collapse" data-bs-target="#navbarNav"
						aria-controls="navbarNav" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse justify-content-end"
						id="navbarNav">
						<ul class="navbar-nav">
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle text-white" href="#"
								id="logoutDropdown" role="button" data-bs-toggle="dropdown"
								aria-expanded="false"> Cerrar sesion </a>
								<ul class="dropdown-menu dropdown-menu-end"
									aria-labelledby="logoutDropdown">
									<li>
										<div class="d-flex flex-column align-items-center p-3">
											<img src="img\Claro.svg.png" alt="Logo CASSIATEC"
												class="logo-img" style="height: 6rem"> <span
												class="align-self-center">Admin</span>
											<button class="btn btn-danger mt-2" data-bs-toggle="modal"
												data-bs-target="#confirmLogoutModal">Cerrar sesion</button>
										</div>
									</li>
								</ul></li>
						</ul>
					</div>
				</div>
			</nav>

			<!-- MENU SUPERIOR DE HORA -->
			<script>
			
			//JS PARA QUE FUNCIONE LA BARRA DE HORA
			
	// Obtener el elemento para mostrar la hora y fecha y actualizarlo cada segundo
	var currentDateTimeElement = document.getElementById("currentDateTime");

	// Funcion para obtener la hora actual en formato HH:MM:SS
	function getCurrentTime() {
		var currentDate = new Date();
		var hours = currentDate.getHours().toString().padStart(2, "0");
		var minutes = currentDate.getMinutes().toString().padStart(2, "0");
		var seconds = currentDate.getSeconds().toString().padStart(2, "0");
		return hours + ":" + minutes + ":" + seconds;
	}

	// Funcion para obtener la fecha actual en formato DD/MM/YYYY
	function getCurrentDate() {
		var currentDate = new Date();
		var days = ['Domingo', 'Lunes', 'Martes', 'Miercoles', 'Jueves', 'Viernes', 'Sabado'];
		var day = days[currentDate.getDay()];
		var date = currentDate.getDate().toString().padStart(2, "0");
		var months = ['enero', 'febrero', 'marzo', 'abril', 'mayo', 'junio', 'julio', 'agosto', 'septiembre', 'octubre', 'noviembre', 'diciembre'];
		var month = months[currentDate.getMonth()];
		var year = currentDate.getFullYear().toString();
		return day + ' ' + date + ' de ' + month + ' de ' + year;
	}

	// Actualizar la hora y fecha cada segundo
	function updateCurrentDateTime() {
		var currentTime = getCurrentTime();
		var currentDate = getCurrentDate();
		currentDateTimeElement.textContent = currentTime + " - " + currentDate;
	}

	// Actualizar la hora y fecha inicial y luego cada segundo
	updateCurrentDateTime();
	setInterval(updateCurrentDateTime, 1000);

	function updateCurrentDateTime() {
		var currentTimeElement = document.getElementById("currentTime");
		var currentDateElement = document.getElementById("currentDate");

		var currentTime = getCurrentTime();
		var currentDate = getCurrentDate();

		currentTimeElement.textContent = currentTime;
		currentDateElement.textContent = currentDate;
	}
</script>

			<!-- BOTON CERRAR SESION -->
			<div class="modal fade" id="confirmLogoutModal" tabindex="-1"
				aria-labelledby="confirmLogoutModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="confirmLogoutModalLabel">Confirmar
								cierre de sesion</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<div class="text-center mx-auto">
								<img src="img\cerrarSESION.png" alt="Logo CASSIATEC"
									class="logo-img" style="height: 6rem">
								<H4>
									<span>¿Desea cerrar <br>sesion?
									</span>
								</H4>
							</div>
						</div>
						<div class="modal-footer">
							<div class="text-center mx-auto">
								<button type="button" class="btn btn-danger"
									onclick="cerrarSesion()">Cerrar sesion</button>
								<script>
									function cerrarSesion() {
										// Redireccionar a la pÃ¡gina de inicio de sesiÃ³n
										window.location.href = "index.jsp";
									}
								</script>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>

		<!-- TARJETA -->
		<div class="row">
			<div class="p-4	">
				<div class="container">
					<div class="row">
						<div class="col-md-10 mx-auto">
							<div class="card">
								<h2 class="text-center mt-4">
											Listar Productos</strong>
										</h2>
								<div class="card-body">
									<form method="post" action="productBuscar">
								  <div class="mb-3 row">
								   
								  
								    <div class="col-sm-3" id="barra_field">
								      <input type="text" class="form-control" id="barra" name="barra" placeholder="Ingrese el Cod.Barra">
								    </div>
								  
								    <div class="col-sm-3" id="objeto_field" style="display: none;">
								      <input type="text" class="form-control" id="objeto" name="objeto" placeholder="Ingrese el objeto">
								    </div>
								    
		
								    <div class="col-sm-2">
								      <select class="form-select" id="search_field" name="search_field" onchange="updateSearchFields()">
								        <option value="barra" selected>Codigo de Barra</option>
								        <option value="objeto">Objecto</option>
								      </select>
								    </div>
								    
								    <div class="col-sm-1">
								      <button type="button" class="btn btn-outline-primary mb-3" id="btnBuscar" name="btnBuscar">Buscar</button>
								    </div>	
    

											<div class="col-sm-1">
												<button type="button" class="btn btn-outline-primary mb-2"
													id="btnNuevo" name="btnNuevo">Insertar</button>
											</div>

  
											<div class="col-sm-0">
												<!--<button type="button" class="btn btn-outline-dark mb-2">...........</button>-->
											</div>
											
										</div>
									</form>
								</div>
							</div>
							<br />
						<!-- Card de resultados -->
							<div class="card" id="divResultado">
								<div class="card-header">Resultados</div>
								<div class="card-body" style="overflow-x: auto;">
								
								
								 
									<table class="table">
										<caption>Aqui podemos encontrar los datos de los
											Productos</caption>
										<thead>
											<tr>
												<th>Code</th>
												<th>description</th>
												<th>stock</th>
												<th>points</th>
												<th>name</th>
												<th>type</th>
												<th>brand</th>
												<th>State</th>
											</tr>
										</thead>
										<tbody id="detalleTabla">
										</tbody>
									</table>
								</div>
							</div>
								<style>
								.card {
									width: 135%;
								}
								</style>

				<!-- Formulario de edicion de registro -->
							<div class="card" id="divRegistro" style="display: none;">
								<div class="card-header" id="tituloRegistro">{accion}
									EMPLEADO</div>
								<div class="card-body">
									<form>
										<input type="hidden" id="accion" name="accion">
										<div class="row mb-3">
											<label for="frmId" class="col-sm-2 col-form-label">ID</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" id="frmId"
													disabled="disabled" value="0">
											</div>
										</div>
										
										<!-- Codigo de barra -->
											<div class="row mb-3">
											   <label for="frmBarra" class="col-sm-2 col-form-label">Cod.Barra</label>
											    <div class="col-sm-10">
											        <input type="text" class="form-control" id="frmBarra" name="frmBarra" required pattern="[0-9]{11}">
											        <div class="valid-feedback">Correcto</div>
											        <div class="invalid-feedback">Es necesario escribir exactamente 11 números en el código de barras</div>
											    </div>
											</div>
						
					
											<script>
												document.addEventListener("DOMContentLoaded", function() {
												  var frmBarra = document.getElementById("frmBarra");
												
												  frmBarra.addEventListener("input", function() {
												    // Eliminar cualquier carácter que no sea un número
												    this.value = this.value.replace(/\D/g, '');
												
												    // Limitar la longitud a 11 dígitos
												    if (this.value.length > 11) {
												      this.value = this.value.slice(0, 11);
												    }
												  });
												});
											</script>
											
					
									<!-- Objetos  -->
											<div class="row mb-3">
										    <label for="frmObject" class="col-sm-2 col-form-label">Objeto</label>
											    <div class="col-sm-10">
											        <input type="text" class="form-control" id="frmObject" name="frmObject" required pattern="[A-Za-záéíóúÁÉÍÓÚ\s]+">
											        <div class="valid-feedback">Correcto</div>
											        <div class="invalid-feedback">Es necesario escribir solo letras en el Objeto</div>
											    </div>
											</div>

											<script>
												document.addEventListener("DOMContentLoaded", function() {
												  var frmObject = document.getElementById("frmObject");
												
												  frmObject.addEventListener("input", function() {
												    // Eliminar cualquier carácter que no sea una letra
												    this.value = this.value.replace(/[^A-Za-záéíóúÁÉÍÓÚ\s]/g, '');
												
												    // Puedes agregar una restricción adicional para evitar espacios iniciales y finales
												    // this.value = this.value.trim();
												  });
												});
											</script>
					
										
									<!-- Costo -->
											<div class="row mb-3">
											    <label for="frmCosto" class="col-sm-2 col-form-label">Costo</label>
											    <div class="col-sm-10">
											        <input type="number" class="form-control" id="frmCosto" name="frmCosto" required>
											        <div class="valid-feedback">Todo bien</div>
											        <div class="invalid-feedback">Es necesario ingresar números en el campo de costo</div>
											    </div>
											</div>

								
										<script>
											document.addEventListener("DOMContentLoaded", function() {
											  var frmCosto = document.getElementById("frmCosto");
		
											  frmCosto.addEventListener("input", function() {
											    // Eliminar cualquier carácter que no sea un número
											    this.value = this.value.replace(/\D/g, '');
											  });
											});
										</script>

						
							
					<!-- Marca -->
									<div class="row mb-3">
									    <label for="frmMarca" class="col-sm-2 col-form-label">Marca</label>
									    <div class="col-sm-10">
									        <input type="text" class="form-control" id="frmMarca" name="frmMarca" required pattern="[A-Za-záéíóúÁÉÍÓÚ\s]+">
									        <div class="valid-feedback">Todo bien</div>
									        <div class="invalid-feedback">Es necesario ingresar solo letras en el campo de Marca</div>
									    </div>
									</div>

					
					
									<script>
										document.addEventListener("DOMContentLoaded", function() {
										  var frmMarca = document.getElementById("frmMarca");
										
										  frmMarca.addEventListener("input", function() {
										    // Eliminar cualquier carácter que no sea una letra
										    this.value = this.value.replace(/[^A-Za-záéíóúÁÉÍÓÚ\s]/g, '');
										  });
										});
									</script>
					
					
					
					<!-- Descripcion -->
					<div class="row mb-3">
					    <label for="frmDescription" class="col-sm-2 col-form-label">Description</label>
					    <div class="col-sm-10">
					        <input type="text" class="form-control" id="frmDescription" name="frmDescription" required pattern="[A-Za-záéíóúÁÉÍÓÚ\s]+">
					        <div class="valid-feedback">Todo bien</div>
					        <div class="invalid-feedback">Es necesario ingresar solo letras en el campo de Description</div>
					    </div>
					</div>

					
					<script>
						document.addEventListener("DOMContentLoaded", function() {
						  var frmDescription = document.getElementById("frmDescription");
						
						  frmDescription.addEventListener("input", function() {
						    // Eliminar cualquier carácter que no sea una letra
						    this.value = this.value.replace(/[^A-Za-záéíóúÁÉÍÓÚ\s]/g, '');
						  });
						});
					</script>

					
					
					
					<!--STOCK  -->
						<div class="row mb-3">
						    <label for="frmStock" class="col-sm-2 col-form-label">Stock</label>
						    <div class="col-sm-10">
						        <input type="number" class="form-control" id="frmStock" name="frmStock" required>
						        <div class="valid-feedback">Todo bien</div>
						        <div class="invalid-feedback">Es necesario ingresar un número en el campo de Stock</div>
						    </div>
						</div>

					
					
					<script>
						document.addEventListener("DOMContentLoaded", function() {
						  var frmStock = document.getElementById("frmStock");
	
						  frmStock.addEventListener("input", function() {
						    // Eliminar cualquier carácter que no sea un número
						    this.value = this.value.replace(/\D/g, '');
						  });
						});
					</script>

			
					
				
					
					
					<button type="button" class="btn btn-primary" id="btnProcesar">Procesar</button>
				</form>
			

				
			</div>
		</div>
	
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	
	
<style>

/*ESTILO PAR AAGRANDAR LOS CAMPOS DE "gRADO" Y "SECCION"*/
    #grade_field input,
	#section_field input {
  height: calc(1.5em + 0.75rem + 2px);
  padding: 0.375rem 0.75rem;
  font-size: 0.875rem;
}

/*ESTOS ESTILOS ES PARA EL BOTON GENERAR CSV */
    .btn.btn-outline-success.mb-1 {
        color: gray;
        transition: color 0.3s, background-color 0.3s; /* Agrega una transición suave */
        border-color: gray; /* Cambia el color del borde a blanco */
    }

    .btn.btn-outline-success.mb-1:hover {
        color: white; /* Cambia el color del texto a blanco */
        background-color: gray; /* Cambia el color de fondo al mismo gris */
        border-color: gray; /* Cambia el color del borde a blanco */
    }
    }


    </style>

	<script src="https://kit.fontawesome.com/3d22aaea26.js"
		crossorigin="anonymous"></script>
		
		<script>
		
		//FUNCIONES		
	
		
		// Constantes del CRUD
		const ACCION_NUEVO = "NUEVO";
		const ACCION_EDITAR = "EDITAR";
		const ACCION_ELIMINAR = "ELIMINAR";

		// Arreglo de registros
		let arreglo = [];
		
		
		//FUNCION PARA QUE LOS REGISTROS APAREZCAN AL DAR CLICK
		window.onload = function() {
			  fnBtnBuscar();
			};
		
		
		//FUNCION PARA CAMBIAR EL SELCT DE CAMPOS DE BUSQUEDA
		function updateSearchFields() {
		  const selectedValue = document.getElementById('search_field').value;
		  const barraField = document.getElementById('barra_field');
		  const objetoField = document.getElementById('objeto_field');
		  
		  if (selectedValue === 'objeto') {
		    barraField.style.display = 'none';
		    objetoField.style.display = 'block';
		  } else {
		    barraField.style.display = 'block';
		    objetoField.style.display = 'none';
		  }
		}


			
			
		// Acceder a los controles
		let btnBuscar = document.getElementById("btnBuscar");
		let btnNuevo = document.getElementById("btnNuevo");
		let btnProcesar = document.getElementById("btnProcesar");

		// Programar los controles
		btnBuscar.addEventListener("click", fnBtnBuscar);
		btnNuevo.addEventListener("click", fnBtnNuevo);
		btnProcesar.addEventListener("click", fnBtnProcesar);
		
		// Funcion fnEditar
		function fnEditar(id) {
			// Preparando el formulario
			document.getElementById("tituloRegistro").innerHTML = ACCION_EDITAR + " REGISTRO";
			document.getElementById("accion").value = ACCION_EDITAR;
			fnCargarForm(id);
			// Mostrar formulario
			document.getElementById("divResultado").style.display = "none";
			document.getElementById("divRegistro").style.display = "block";
		}

		// Funcion fnEliminar
		function fnEliminar(id) {
			// Preparando el formulario
			/*
			document.getElementById("tituloRegistro").innerHTML = ACCION_ELIMINAR
					+ " REGISTRO";
			document.getElementById("accion").value = ACCION_ELIMINAR;
			fnCargarForm(id);
			fnEstadoFormulario(ACCION_ELIMINAR)
			// Mostrar formulario
			document.getElementById("divResultado").style.display = "none";
			document.getElementById("divRegistro").style.display = "block";
			*/
			document.getElementById("accion").value = ACCION_ELIMINAR;
			fnCargarForm(id);
			fnBtnProcesar();
			fnBtnBuscar();
		}

	 // Funcion fnBtnProcesar
		function fnBtnProcesar() {
			// Preparar los datos
			let datos = "accion=" + document.getElementById("accion").value;
			datos += "&code=" + document.getElementById("frmId").value;
			datos += "&description="
					+ document.getElementById("frmBarra").value;
			datos += "&stock=" + document.getElementById("frmObject").value;
			datos += "&points="
					+ document.getElementById("frmCosto").value;
			datos += "&name=" + document.getElementById("frmMarca").value;
			datos += "&type=" + document.getElementById("frmDescription").value;
			datos += "&brand=" + document.getElementById("frmStock").value;
			datos += "&state=" + document.getElementById("frmStock").value;
			// El envio con AJAX
			let xhr = new XMLHttpRequest();
			xhr.open("POST", "productProcesar", true);
			xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
			xhr.onreadystatechange = function() {
				if (xhr.readyState === 4 && xhr.status === 200) {
					// La solicitud se completÃ³ correctamente
					console.log(xhr.responseText);
					alert(xhr.responseText);
					
					// Redireccionar a la página de registros
				      window.location.href = "ListarProduct.jsp";
				}
			};
			xhr.send(datos);
		}
		

	 

		// Funcion fnBtnNuevo
		function fnBtnNuevo() {
		    // Preparando el formulario
		    document.getElementById("tituloRegistro").innerHTML = ACCION_NUEVO + " REGISTRO";
		    document.getElementById("accion").value = ACCION_NUEVO;
		    
		    // Restablecer los valores de los campos del formulario
		    document.getElementById("frmId").value = "";
		    document.getElementById("frmBarra").value = "";
		    document.getElementById("frmObject").value = "";
		    document.getElementById("frmCosto").value = "";
		    document.getElementById("frmMarca").value = "";
		    document.getElementById("frmDescription").value = "";
		    document.getElementById("frmStock").value = "";
		    
		    // Mostrar formulario
		    document.getElementById("divResultado").style.display = "none";
		    document.getElementById("divRegistro").style.display = "block";
		}


		// Funcion fnBtnBuscar
		function fnBtnBuscar() {
		  // Datos
		  let last_names = document.getElementById("last_names").value;
		  let names = document.getElementById("names").value;
		  let searchField = document.getElementById("search_field").value;
		  let document_number = ""; //Modificar

		  // Obtener valores adicionales según la opción seleccionada en el campo de búsqueda
		  if (searchField === "document_number") {
		    document_number = document.getElementById("document_number").value;
		  } else if (searchField === "grade_section") {
			level = document.getElementById("level").value;
		    grade = document.getElementById("grade").value;
		    section = document.getElementById("section").value;
		  }

		  // Preparar la URL
		  let url =
		    "productBuscar2?last_names=" +
		    last_names +
		    "&names=" +
		    names +
		    "&document_number=" +
		    document_number +
		    "&level=" +
		    level +
		    "&grade=" +
		    grade +
		    "&section=" +
		    section;

		  // Llamada AJAX
		  let xhttp = new XMLHttpRequest();
		  xhttp.open("GET", url, true);
		  xhttp.onreadystatechange = function () {
		    if (this.readyState == 4 && this.status == 200) {
		      let respuesta = xhttp.responseText;
		      arreglo = JSON.parse(respuesta);
		      let detalleTabla = "";
		      arreglo.forEach(function (item) {
		        {

		          detalleTabla += "<tr>";
		          detalleTabla += "<td>" + item.code + "</td>";
		          detalleTabla += "<td>" + item.description + "</td>";
		          detalleTabla += "<td>" + item.points + "</td>";
		          detalleTabla += "<td>" + item.name + "</td>";
		          detalleTabla += "<td>" + item.type + "</td>";
		          detalleTabla += "<td>" + item.brand + "</td>";
		          detalleTabla += "<td>" + item.state + "</td>";
		          detalleTabla += "<td>";
		          detalleTabla +=
		        	  "<a href='javascript:fnEditar(" + item.id + ");' class='btn btn-primary btn-icon'><i class='fas fa-pencil-alt'></i></a> ";
		          detalleTabla += "<td>";
		          detalleTabla +=
		        	  "<a href='javascript:fnEliminar(" + item.id + ");' class='btn btn-danger btn-icon'><i class='fas fa-trash-alt'></i></a>";
		          detalleTabla += "</td>";
		          detalleTabla += "</tr>";
		        }
		      });
		      document.getElementById("detalleTabla").innerHTML = detalleTabla;
		      // Mostrar formulario
		      document.getElementById("divResultado").style.display = "block";
		      document.getElementById("divRegistro").style.display = "none";
		      
		   // Limpiar campos de búsqueda
		      document.getElementById("barra").value = "";
		      document.getElementById("object").value = "";
		      
		    }
		  };
		  xhttp.send();
		}



		
		/*Este de aca lista los resultados*/
		
		  function listar(status) {
			  // Preparar la URL
			  let url = "productBuscar2?status=" + status;

			  // Realizar la llamada AJAX
			  let xhttp = new XMLHttpRequest();
			  xhttp.open("GET", url, true);
			  xhttp.onreadystatechange = function() {
			    if (this.readyState == 4 && this.status == 200) {
			      let respuesta = xhttp.responseText;
			      arreglo = JSON.parse(respuesta);
			      let detalleTabla = "";
			      arreglo.forEach(function(item) {
			        { // Esta accion verifica si el estado coincide con el filtro
			          detalleTabla += "<tr>";
			          detalleTabla += "<td>" + item.code + "</td>";
			          detalleTabla += "<td>" + item.description + "</td>";
			          detalleTabla += "<td>" + item.points + "</td>";
			          detalleTabla += "<td>" + item.name + "</td>";
			          detalleTabla += "<td>" + item.type + "</td>";
			          detalleTabla += "<td>" + item.brand + "</td>";
			          detalleTabla += "<td>" + item.state + "</td>";
			          detalleTabla += "<td>" + item.stock + "</td>";
			          detalleTabla += "<td>";
			          detalleTabla += 
			        	  "<a href='javascript:fnEditar(" + item.id + ");' class='btn btn-primary btn-icon'><i class='fas fa-pencil-alt'></i></a> ";
			          detalleTabla += "<td>";
			          detalleTabla += 
			        	  "<a href='javascript:fnEliminar(" + item.id + ");' class='btn btn-danger btn-icon'><i class='fas fa-trash-alt'></i></a>";
			          detalleTabla += "</td>";
			          detalleTabla += "</tr>";
			        }
			      });
			      document.getElementById("detalleTabla").innerHTML = detalleTabla;

			      // Mostrar/ocultar elementos según sea necesario
			      document.getElementById("divResultado").style.display = "block";
			      document.getElementById("divRegistro").style.display = "none";
			    }
			  };
			  xhttp.send();
			}


		
		
	//Carga de datos
		
		function fnCargarForm(id){
			arreglo.forEach(function(item) {
				if(item.id == id){
					document.getElementById("frmId").value = item.id;
					document.getElementById("frmBarra").value = item.barcode;
					document.getElementById("frmObject").value = item.objects;
 					document.getElementById("frmCosto").value = item.cost;
					document.getElementById("frmMarca").value = item.brand;
					document.getElementById("frmDescription").value = item.descriptions;
					document.getElementById("frmStock").value = item.stock;
					//break;
				}
			});
		}
	</script>
</body>
</html>