<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<!-- Favicon -->
<link rel="icon" type="image/png" href="img/G.png">

<title>GRAN</title>
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

			<!-- MENU SUPERIOR DE HORA -->
			<div class="col">
				<jsp:include page="menu.jsp"></jsp:include>
			</div>
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
											<img src="img\iconoUSUARIO.png" alt="Logo CASSIATEC"
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


			<script>
	// Obtener el elemento para mostrar la hora y fecha y actualizarlo cada segundo
	var currentDateTimeElement = document.getElementById("currentDateTime");

	// Función para obtener la hora actual en formato HH:MM:SS
	function getCurrentTime() {
		var currentDate = new Date();
		var hours = currentDate.getHours().toString().padStart(2, "0");
		var minutes = currentDate.getMinutes().toString().padStart(2, "0");
		var seconds = currentDate.getSeconds().toString().padStart(2, "0");
		return hours + ":" + minutes + ":" + seconds;
	}

	// Función para obtener la fecha actual en formato DD/MM/YYYY
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
										// Redireccionar a la página de inicio de sesión
										window.location.href = "index.jsp";
									}
								</script>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
</body>
</html>