<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<link rel="icon" type="image/x-icon" href="/assets/logo-vt.svg" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!-- Favicon -->
<link rel="icon" type="image/png" href="img/Claro.svg.png">
<title>Register</title>
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
    crossorigin="anonymous" />
<style>
.custom-bg {
    background-image: url("img/Imagen1.jpg");
    background-size: cover;
    background-position: center;
}

:root {
    --white: rgb(255, 0, 0);
    --light-grey: rgb(0, 0, 0);
    --beaver: rgb(255, 0, 0);
    --black: rgb(0, 4, 255);
    --eerie-black: rgb(31, 31, 31);
    --jet: rgb(0, 208, 255);
}

/* CARGA DE LA PAGINA */
.container--loader {
    background-color: var(--eerie-black);
    position: fixed;
    width: 100vw;
    height: 100vh;
    z-index: 9999;
    transition: all 2.5s;
    display: flex;
    align-items: center;
    justify-content: center;
}

.loader,
.loader:before,
.loader:after {
    border-radius: 50%;
    width: 2rem;
    height: 2rem;
    animation: loader 2.5s infinite ease-in-out;
}

.loader {
    color: var(--beaver);
    font-size: 13px;
    position: relative;
    animation-delay: -50.16s;
}

.loader:before,
.loader:after {
    content: '';
    position: absolute;
    top: 0;
}

.loader:before {
    left: -3.5rem;
    animation-delay: -50.32s;
}

.loader:after {
    left: 3.5rem;
}

@keyframes loader {
    0%, 80%, 100% {
        box-shadow: 0 2.5rem 0 -1.3rem;
    }
    40% {
        box-shadow: 0 2.5rem 0 0;
    }
}
</style>
</head>
<body class="custom-bg d-flex justify-content-center align-items-center vh-100">

<!-- START Loader -->
<div class="container--loader">
    <div class="loader"></div>
</div>
<!-- END Loader -->

<div class="bg-white p-5 rounded-5 text-secondary shadow" style="width: 25rem">
    <div class="d-flex justify-content-center">
        <img src="img\Claro.svg.png" alt="login-icon" style="height: 7rem" />
    </div>
    <div class="text-black text-center fs-1 fw-bold">Register</div>
	<form action="procesarFormulario.jsp" method="post" onsubmit="return validarFormulario()">    
        <div class="input-group mt-1">
    	<div class="input-group-text bg-success">
        	<img src="img/nombres.png" alt="nombre" style="height: 30px" />
	    </div>
	    	<input class="form-control bg-light" type="text" placeholder="Nombres" name="Nombres" />
		</div>
        
        <div class="input-group mt-1">
		    <div class="input-group-text bg-success">
		        <img src="img/nombres.png" alt="user-icon" style="height:  30px" />
		    </div>
		    <input class="form-control bg-light" type="text" placeholder="Apellidos" name="Apellidos" />
		</div>
		<div class="input-group mt-1">
		    <div class="input-group-text bg-success">
		        <img src="img/correo.png" alt="email-icon" style="height: 30px" />
		    </div>
		    <input class="form-control bg-light" type="email" placeholder="Correo" name="Correo" />
		</div>
		<div class="input-group mt-1">
		    <div class="input-group-text bg-success">
		        <img src="img/celular.png" alt="phone-icon" style="height: 30px" />
		    </div>
		    <input class="form-control bg-light" type="tel" placeholder="Celular" name="Celular" />
		</div>
		<div class="input-group mt-1">
		    <div class="input-group-text bg-success">
		        <img src="img/username-icon.svg" alt="user-icon" style="height: 30px" />
		    </div>
		    <input class="form-control bg-light" type="text" placeholder="Usuario" name="Usuario" />
		</div>
		<div class="input-group mt-1">
		    <div class="input-group-text bg-success">
		        <img src="img/password-icon.svg" alt="password-icon" style="height: 30px" />
		    </div>
		    <input class="form-control bg-light" type="password" placeholder="Contraseña" name="Contraseña" />
		</div>
		<div class="input-group mt-1">
		    <div class="input-group-text bg-success">
		        <img src="img/DNI.png" alt="user-icon" style="height: 30px" />
		    </div>
		    <select class="form-control bg-light" name="Tipo de Documento">
		        <option value="passport">DNI</option>
		        <option value="id_card">CNE</option>
		    </select>
		</div>
		<div class="input-group mt-1">
		    <div class="input-group-text bg-success">
		        <img src="img/DNI.png" alt="user-icon" style="height: 30px" />
		    </div>
		    <input class="form-control bg-light" type="text" placeholder="Number Document" name="number_document" />
		</div>

        <!-- Solo es una prueba de enlace cuando se ingrese al sistema -->
        <button type="button" class="btn btn-danger w-100 mt-4 fw-semibold shadow-sm" onclick="Ingresar()" >Ingresar</button>
    </form>
</div>
		<div>
	
			<script>
	  function Ingresar() {
	    // Redireccionar a la página "inicioPerson.jsp"
	    window.location.href = "index.jsp"; //linkeado
	  }
	</script>
		</div>
		
<script>
/* ===== Loader =====*/
window.addEventListener('load', () => {
    const contenedorLoader = document.querySelector('.container--loader');
    contenedorLoader.style.opacity = 0;
    contenedorLoader.style.visibility = 'hidden';
});
</script>

<script>
/* ===== Formulario =====*/
/* ===== Formulario =====*/
function validarFormulario() {
    var nombres = document.getElementsByName("Nombres")[0].value;
    var apellidos = document.getElementsByName("Apellidos")[0].value;

    // Verificar si los campos obligatorios están vacíos
    if (nombres.trim() === "" || apellidos.trim() === "") {
        alert("Por favor, complete los campos de Nombres y Apellidos.");
        return false; // Evita la redirección
    }

    // Continuar con la redirección si los campos obligatorios están completos
    return true;
}
</script>
</body>
</html>
