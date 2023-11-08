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
				class="navbar navbar-expand-lg navbar-dark bg-danger navbar-with-datetime">
				<div class="container-fluid">
					<div
						class="d-flex justify-content-center align-items-center flex-grow-1">
						<span id="currentDateTime"
							class="nav-link text-white text-center w-80"> <span
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
											<img src="img\Claro.svg.png" alt="LogoClaro" class="logo-img"
												style="height: 6rem"> <span class="align-self-center">Admin</span>
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
				var currentDateTimeElement = document
						.getElementById("currentDateTime");

				// Funcion para obtener la hora actual en formato HH:MM:SS
				function getCurrentTime() {
					var currentDate = new Date();
					var hours = currentDate.getHours().toString().padStart(2,
							"0");
					var minutes = currentDate.getMinutes().toString().padStart(
							2, "0");
					var seconds = currentDate.getSeconds().toString().padStart(
							2, "0");
					return hours + ":" + minutes + ":" + seconds;
				}

				// Funcion para obtener la fecha actual en formato DD/MM/YYYY
				function getCurrentDate() {
					var currentDate = new Date();
					var days = [ 'Domingo', 'Lunes', 'Martes', 'Miercoles',
							'Jueves', 'Viernes', 'Sabado' ];
					var day = days[currentDate.getDay()];
					var date = currentDate.getDate().toString()
							.padStart(2, "0");
					var months = [ 'enero', 'febrero', 'marzo', 'abril',
							'mayo', 'junio', 'julio', 'agosto', 'septiembre',
							'octubre', 'noviembre', 'diciembre' ];
					var month = months[currentDate.getMonth()];
					var year = currentDate.getFullYear().toString();
					return day + ' ' + date + ' de ' + month + ' de ' + year;
				}

				// Actualizar la hora y fecha cada segundo
				function updateCurrentDateTime() {
					var currentTime = getCurrentTime();
					var currentDate = getCurrentDate();
					currentDateTimeElement.textContent = currentTime + " - "
							+ currentDate;
				}

				// Actualizar la hora y fecha inicial y luego cada segundo
				updateCurrentDateTime();
				setInterval(updateCurrentDateTime, 1000);

				function updateCurrentDateTime() {
					var currentTimeElement = document
							.getElementById("currentTime");
					var currentDateElement = document
							.getElementById("currentDate");

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
								<img src="img\Claro.svg.png" alt="LogoClaro" class="logo-img"
									style="height: 6rem">
								<H4>
									<span>�Desea cerrar <br>sesion?
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
										window.location.href = "Login.jsp";
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
			<div class="p-4">
				<div class="container">
					<div class="row">
						<div class="col-md-10 mx-auto">
							<div class="card">
								<h2 class="text-center mt-4">
									Listar Client</strong>
								</h2>
								<div class="card-body">
									<form method="post" action="clientBuscar">
										<div class="mb-2 row">
											<div class="col-sm-2" id="names_field">
												<input type="text" class="form-control" id="names"
													name="names" placeholder="Ingrese nombre">
											</div>
											<div class="col-sm-3" id="last_name_field">
												<input type="text" class="form-control" id="lastname"
													name="lastname" placeholder="Ingrese apellido">
											</div>

											<div class="col-sm-3" id="document_number_field"
												style="display: none;">
												<input type="number" class="form-control"
													id="number_document" name="number_document"
													placeholder="Ingrese N� de documento">
											</div>

											<div class="col-sm-3" id="cellphone_field"
												style="display: none;">
												<input type="number" class="form-control" id="cellphone"
													name="cellphone" placeholder="Ingresa El Celular">
											</div>


											<div class="col-sm-4">
												<select class="form-select" id="search_field"
													name="search_field" onchange="updateSearchFields()">
													<option value="names_last_names" selected>Nombres
														y apellidos</option>
													<option value="number_document">N� de documento</option>
												</select>
											</div>
											<div class="col-sm-1">
												<button type="button" class="btn btn-outline-primary mb-2"
													id="btnBuscar" name="btnBuscar">Buscar</button>
											</div>
											<br>
											<div class="col-sm-1">
												<button type="button" class="btn btn-outline-primary mb-2"
													id="btnNuevo" name="btnNuevo">Insertar</button>
											</div>

											<div class="form-check form-switch" style="right: 100%;">
												<input class="form-check-input" type="checkbox"
													role="switch" id="flexSwitchCheckDefault" checked
													onchange="filtrarRegistros()"> <label
													class="form-check-label" for="flexSwitchCheckDefault"
													id="labelSwitch">Activo</label>
											</div>
										</div>
									</form>
								</div>
							</div>
							<br />

							<!-- Card de resultados -->
							<div class="card" id="divResultado">
								<div class="card-header">Resultado</div>
								<div class="card-body" style="overflow-x: auto;">
									<table class="table">
										<caption>Aqui podemos encontrar los datos de los
											Clientes</caption>
										<thead>
											<tr>
												<th>Id</th>
												<th>Nombre</th>
												<th>Apellido</th>
												<th>Tipo de Documento</th>
												<th>Numero de documento</th>
												<th>Celular</th>
												<th>Email</th>
												<th>Estado</th>
												<th>Editar</th>
												<th>Eliminar</th>
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

										<div class="row mb-3">
											<label for="frmNames" class="col-sm-2 col-form-label">Nombre</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" id="frmNames"
													name="frmNames" required
													pattern="[A-Za-záéíóúÁÉÍÓÚ\s]+">
												<div class="valid-feedback">Correcto</div>
												<div class="invalid-feedback">Es necesario escribir
													solo letras en el nombre</div>
											</div>
										</div>

										<script>
											var nombresInput = document
													.getElementById('frmNames');
											nombresInput
													.addEventListener(
															'input',
															function(event) {
																var nombres = event.target.value;
																var regex = /^[A-Za-z\s]+$/;
																if (nombres === '') {
																	nombresInput.classList
																			.remove('is-valid');
																	nombresInput.classList
																			.remove('is-invalid');
																} else if (regex
																		.test(nombres)) {
																	nombresInput.classList
																			.remove('is-invalid');
																	nombresInput.classList
																			.add('is-valid');
																} else {
																	nombresInput.classList
																			.remove('is-valid');
																	nombresInput.classList
																			.add('is-invalid');
																}
															});
										</script>



										<div class="row mb-3">
											<label for="frmLast_name" class="col-sm-2 col-form-label">Apellido</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" id="frmLast_name"
													name="frmLast_name" required
													pattern="[A-Za-záéíóúÁÉÍÓÚ\s]+">
												<div class="valid-feedback">Correcto</div>
												<div class="invalid-feedback">Es necesario escribir
													solo letras en el apellido</div>
											</div>
										</div>

										<script>
											// Obtener el campo de entrada de apellidos
											var apellidosInput = document
													.getElementById('frmLast_name');

											// Agregar un event listener para el evento 'input'
											apellidosInput
													.addEventListener(
															'input',
															function(event) {
																// Obtener el valor actual del campo de apellidos
																var apellidos = event.target.value;

																// Expresión regular para validar solo letras y espacios
																var regex = /^[A-Za-z\s]+$/;

																// Validar el valor ingresado
																if (apellidos === '') {
																	// El campo está vacío
																	apellidosInput.classList
																			.remove('is-valid');
																	apellidosInput.classList
																			.remove('is-invalid');
																} else if (regex
																		.test(apellidos)) {
																	// El valor es válido
																	apellidosInput.classList
																			.remove('is-invalid');
																	apellidosInput.classList
																			.add('is-valid');
																} else {
																	// El valor es inválido
																	apellidosInput.classList
																			.remove('is-valid');
																	apellidosInput.classList
																			.add('is-invalid');
																}
															});
										</script>

										<div class="row mb-3">
											<label for="frmCellphone" class="col-sm-2 col-form-label">Numero
												de Celular</label>
											<div class="col-sm-10">
												<input type="tel" class="form-control" id="frmCellphone"
													name="frmCellphone"
													placeholder="Ingrese su numero de celular">
												<div class="valid-feedback">Todo bien</div>
											</div>
										</div>

										<!-- Celular Script -->
										<script>
											// Obtén el elemento del campo de entrada por su ID
											var frmCellphone = document
													.getElementById("frmCellphone");

											// Agrega un evento de escucha para el evento "input"
											frmCellphone
													.addEventListener(
															"input",
															function() {
																// Elimina cualquier carácter que no sea un número
																var value = frmCellphone.value
																		.replace(
																				/\D/g,
																				"");

																// Limita el valor a 9 dígitos
																if (value.length > 9) {
																	value = value
																			.slice(
																					0,
																					9);
																}

																// Asigna el valor modificado de vuelta al campo de entrada
																frmCellphone.value = value;
															});
										</script>



										<!-- Email -->
										<div class="row mb-3">
											<label for="frmEmail" class="col-sm-2 col-form-label">Email</label>
											<div class="col-sm-10">
												<input type="email" class="form-control" id="frmEmail"
													name="frmEmail" required
													pattern="^[a-zA-Z0-9._%+-]+@{1}[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$">
												<div class="valid-feedback">Todo bien</div>
												<div class="invalid-feedback">Es necesario el Correo
													Electronico (ejemplo@dominio.com)</div>

											</div>
										</div>

										<script>
											// Obtener el campo de entrada de correo electrónico
											var emailInput = document
													.getElementById('frmEmail');
											// Agregar un event listener para el evento 'input'
											emailInput
													.addEventListener(
															'input',
															function(event) {
																// Validar si el correo electrónico es válido
																if (emailInput
																		.checkValidity()) {
																	emailInput.classList
																			.remove('is-invalid');
																	emailInput.classList
																			.add('is-valid');
																} else {
																	emailInput.classList
																			.remove('is-valid');
																	emailInput.classList
																			.add('is-invalid');
																}
															});
										</script>



										<div class="row mb-3">
											<label for="frmDocument_type" class="col-sm-2 col-form-label">Tipo
												de documento</label>
											<div class="col-sm-10">
												<select class="form-control" id="frmDocument_type"
													name="frmDocument_type" required>
													<option value="">Seleccionar Identificacion</option>
													<option value="DNI">DNI</option>
													<option value="CNE">CNE</option>

													<!-- Agrega más opciones  si es necesario -->
												</select>
												<div class="valid-feedback">Todo bien</div>
												<div class="invalid-feedback">Es necesario seleccionar
													una identificacion</div>
											</div>
										</div>


										<script>
											// Obtener el campo de entrada de tipo de documento
											var documentTypeInput = document
													.getElementById('frmDocument_type');
											// Agregar un event listener para el evento 'input'
											documentTypeInput
													.addEventListener(
															'input',
															function(event) {
																// Validar si se ha seleccionado una opción
																if (event.target.value === '') {
																	documentTypeInput.classList
																			.remove('is-valid');
																	documentTypeInput.classList
																			.add('is-invalid');
																} else {
																	documentTypeInput.classList
																			.remove('is-invalid');
																	documentTypeInput.classList
																			.add('is-valid');
																}
															});
										</script>





										<div class="row mb-3">
											<label for="frmDocument_number"
												class="col-sm-2 col-form-label">N� de documento</label>
											<div class="col-sm-10">
												<input type="text" class="form-control"
													id="frmDocument_number" name="frmDocument_number" required>
												<div class="valid-feedback">Todo bien</div>
												<div class="invalid-feedback">Es necesario el N� de
													documento DNI (8 digitos)</div>
											</div>
										</div>


										<script>
											// Obtener el campo de entrada de número de documento
											var documentNumberInput = document
													.getElementById('frmDocument_number');

											// Agregar un event listener para el evento 'input'
											documentNumberInput
													.addEventListener(
															'input',
															function(event) {
																// Obtener el tipo de documento seleccionado
																var documentType = document
																		.getElementById('frmDocument_type').value;
																// Obtener el valor del número de documento
																var documentNumber = event.target.value;

																// Validar la longitud del número de documento según el tipo seleccionado
																if ((documentType === 'DNI' && documentNumber.length === 8)
																		|| (documentType === 'CNE' && documentNumber.length === 15)) {
																	documentNumberInput.classList
																			.remove('is-invalid');
																	documentNumberInput.classList
																			.add('is-valid');
																} else {
																	documentNumberInput.classList
																			.remove('is-valid');
																	documentNumberInput.classList
																			.add('is-invalid');
																	// Truncar el valor del número de documento si supera la longitud permitida
																	if (documentNumber.length > 8
																			&& documentType === 'DNI') {
																		documentNumberInput.value = documentNumber
																				.slice(
																						0,
																						8);
																	} else if (documentNumber.length > 15
																			&& documentType === 'CNE') {
																		documentNumberInput.value = documentNumber
																				.slice(
																						0,
																						15);
																	}
																}
															});
										</script>


										<div class="row mb-3">
											<label for="frmStatus" class="col-sm-2 col-form-label">Estado</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" id="frmStatus"
													disabled="disabled" value="A">
											</div>
										</div>



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
#grade_field input, #section_field input {
	height: calc(1.5em + 0.75rem + 2px);
	padding: 0.375rem 0.75rem;
	font-size: 0.875rem;
}

/*ESTOS ESTILOS ES PARA EL BOTON GENERAR CSV */
.btn.btn-outline-success.mb-1 {
	color: gray;
	transition: color 0.3s, background-color 0.3s;
	/* Agrega una transición suave */
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
			const lastNameField = document.getElementById('last_name_field');
			const namesField = document.getElementById('names_field');
			const documentNumberField = document
					.getElementById('document_number_field');
			const cellphoneField = document.getElementById('cellphone_field');

			if (selectedValue === 'number_document') {
				lastNameField.style.display = 'none';
				namesField.style.display = 'none';
				documentNumberField.style.display = 'block';
				cellphoneField.style.display = 'none';

			} else if (selectedValue === 'cellPhone') {
				lastNameField.style.display = 'none';
				namesField.style.display = 'none';
				documentNumberField.style.display = 'none';
				cellphoneField.style.display = 'block';

			} else {
				lastNameField.style.display = 'block';
				namesField.style.display = 'block';
				documentNumberField.style.display = 'none';
				cellphoneField.style.display = 'none';

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
			document.getElementById("tituloRegistro").innerHTML = ACCION_EDITAR
					+ " REGISTRO";
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
			datos += "&id=" + document.getElementById("frmId").value;
			datos += "&names=" + document.getElementById("frmNames").value;
			datos += "&lastname="
					+ document.getElementById("frmLast_name").value;
			datos += "&cellphone="
					+ document.getElementById("frmCellphone").value;
			datos += "&email=" + document.getElementById("frmEmail").value;
			datos += "&type_document="
					+ document.getElementById("frmDocument_type").value;
			datos += "&number_document="
					+ document.getElementById("frmDocument_number").value;
			// El envio con AJAX
			let xhr = new XMLHttpRequest();
			xhr.open("POST", "clientProcesar", true);
			xhr.setRequestHeader('Content-type',
					'application/x-www-form-urlencoded');
			xhr.onreadystatechange = function() {
				if (xhr.readyState === 4 && xhr.status === 200) {
					// La solicitud se completÃ³ correctamente
					console.log(xhr.responseText);
					alert(xhr.responseText);

					// Redireccionar a la página de registros
					window.location.href = "ListarClientes.jsp";
				}
			};
			xhr.send(datos);
		}

		// Funcion fnBtnNuevo
		function fnBtnNuevo() {
			// Preparando el formulario
			document.getElementById("tituloRegistro").innerHTML = ACCION_NUEVO
					+ " REGISTRO";
			document.getElementById("accion").value = ACCION_NUEVO;

			// Restablecer los valores de los campos del formulario
			document.getElementById("frmId").value = "";
			document.getElementById("frmNames").value = "";
			document.getElementById("frmLast_name").value = "";
			document.getElementById("frmCellphone").value = "";
			document.getElementById("frmEmail").value = "";
			document.getElementById("frmDocument_type").value = "";
			document.getElementById("frmDocument_number").value = "";

			// Mostrar formulario
			document.getElementById("divResultado").style.display = "none";
			document.getElementById("divRegistro").style.display = "block";
		}

		// Funcion fnBtnBuscar
		function fnBtnBuscar() {
			// Datos
			let lastname = document.getElementById("lastname").value;
			let names = document.getElementById("names").value;
			let searchField = document.getElementById("search_field").value;
			let number_document = "";
			let cellphone = "";

			// Obtener valores adicionales según la opción seleccionada en el campo de búsqueda
			if (searchField === "number_document") {
				number_document = document.getElementById("number_document").value;
			} else if (searchField === "cellPhone") {
				cellphone = document.getElementById("cellphone").value;

			}

			// Preparar la URL
			let url = "clientBuscar2?lastname=" + lastname + "&names=" + names
					+ "&number_document=" + number_document + "&cellphone="
					+ cellphone;

			// Llamada AJAX
			let xhttp = new XMLHttpRequest();
			xhttp.open("GET", url, true);
			xhttp.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {
					let respuesta = xhttp.responseText;
					arreglo = JSON.parse(respuesta);
					let detalleTabla = "";
					arreglo
							.forEach(function(item) {
								if (item.status === "A") {
									// Filtrar por estado "A"
									detalleTabla += "<tr>";
									detalleTabla += "<td>" + item.id + "</td>";
									detalleTabla += "<td>" + item.names
											+ "</td>";
									detalleTabla += "<td>" + item.lastname
											+ "</td>";
									detalleTabla += "<td>" + item.type_document
											+ "</td>";
									detalleTabla += "<td>"
											+ item.number_document + "</td>";
									detalleTabla += "<td>" + item.cellphone
											+ "</td>";
									detalleTabla += "<td>" + item.email
											+ "</td>";
									detalleTabla += "<td>" + item.status
											+ "</td>";
									detalleTabla += "<td>";
									detalleTabla += "<a href='javascript:fnEditar("
											+ item.id
											+ ");' class='btn btn-primary btn-icon'><i class='fas fa-pencil-alt'></i></a> ";
									detalleTabla += "<td>";
									detalleTabla += "<a href='javascript:fnEliminar("
											+ item.id
											+ ");' class='btn btn-danger btn-icon'><i class='fas fa-trash-alt'></i></a>";
									detalleTabla += "</td>";
									detalleTabla += "</tr>";
								}
							});
					document.getElementById("detalleTabla").innerHTML = detalleTabla;
					// Mostrar formulario
					document.getElementById("divResultado").style.display = "block";
					document.getElementById("divRegistro").style.display = "none";

					// Limpiar campos de busqueda
					document.getElementById("lastname").value = "";
					document.getElementById("names").value = "";
					document.getElementById("number_document").value = "";
					document.getElementById("cellphone").value = "";

				}
			};
			xhttp.send();
		}

		//Funcion Listar Activos/Inactivos

		/*Este codigo de aca le da la funcion
		al boton*/
		function filtrarRegistros() {
			var checkbox = document.getElementById("flexSwitchCheckDefault");
			var label = document.getElementById("labelSwitch");
			if (checkbox.checked) {
				label.innerHTML = "Activo";
				listar("A");
			} else {
				label.innerHTML = "Inactivo";
				listar("I");
			}
		}

		/*Este de aca lista los resultados*/

		function listar(status) {
			// Preparar la URL
			let url = "clientBuscar2?status=" + status;

			// Realizar la llamada AJAX
			let xhttp = new XMLHttpRequest();
			xhttp.open("GET", url, true);
			xhttp.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {
					let respuesta = xhttp.responseText;
					arreglo = JSON.parse(respuesta);
					let detalleTabla = "";
					arreglo
							.forEach(function(item) {
								if (item.status === status) { // Esta accion verifica si el estado coincide con el filtro
									detalleTabla += "<tr>";
									detalleTabla += "<td>" + item.id + "</td>";
									detalleTabla += "<td>" + item.names
											+ "</td>";
									detalleTabla += "<td>" + item.lastname
											+ "</td>";
									detalleTabla += "<td>" + item.type_document
											+ "</td>";
									detalleTabla += "<td>"
											+ item.number_document + "</td>";
									detalleTabla += "<td>" + item.cellphone
											+ "</td>";
									detalleTabla += "<td>" + item.email
											+ "</td>";
									detalleTabla += "<td>" + item.status
											+ "</td>";
									detalleTabla += "<td>";
									detalleTabla += "<a href='javascript:fnEditar("
											+ item.id
											+ ");' class='btn btn-primary btn-icon'><i class='fas fa-pencil-alt'></i></a> ";
									detalleTabla += "<td>";
									detalleTabla += "<a href='javascript:fnEliminar("
											+ item.id
											+ ");' class='btn btn-danger btn-icon'><i class='fas fa-trash-alt'></i></a>";
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

		function fnCargarForm(id) {
			arreglo
					.forEach(function(item) {
						if (item.id == id) {
							document.getElementById("frmId").value = item.id;
							document.getElementById("frmNames").value = item.names;
							document.getElementById("frmLast_name").value = item.lastname;
							document.getElementById("frmDocument_type").value = item.type_document;
							document.getElementById("frmDocument_number").value = item.number_document;
							document.getElementById("frmCellphone").value = item.cellphone;
							document.getElementById("frmEmail").value = item.email;
							//break;
						}
					});
		}
	</script>
</body>
</html>
