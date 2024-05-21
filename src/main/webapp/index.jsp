<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>API REST UCAM</title>
	<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
	<style>
		body {
			font-family: Arial, sans-serif;
			margin: 0;
			padding: 20px;
			background-color: #f4f4f4;
		}

		h1, h2 {
			color: #333;
			text-align: center;
		}
		
		form {
			background: #fff;
			padding: 20px;
			margin-bottom: 20px;
			border-radius: 8px;
			box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
		}

		form input[type="text"] {
			width: calc(100% - 22px);
			padding: 10px;
			margin: 5px 0 10px;
			border: 1px solid #ddd;
			border-radius: 4px;
		}

		form button {
			padding: 10px 15px;
			margin-right: 10px;
			background-color: #007bff;
			color: #fff;
			border: none;
			border-radius: 4px;
			cursor: pointer;
		}

		form button:hover {
			background-color: #0056b3;
		}

		ul {
			list-style: none;
			padding: 0;
		}

		ul li {
			background: #fff;
			padding: 10px;
			margin-bottom: 5px;
			border-radius: 4px;
			display: flex;
			justify-content: space-between;
			align-items: center;
			box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
		}

		ul li button {
			padding: 5px 10px;
			background-color: #dc3545;
			color: #fff;
			border: none;
			border-radius: 4px;
			cursor: pointer;
		}

		ul li button:hover {
			background-color: #c82333;
		}
	</style>
	<script type="text/javascript">
		//loadAsignatura
		function loadAsignatura(idAsignatura, nombreAsignatura){
			var entry = document.createElement('li');
			var a = document.createElement('button');
			var linkText = document.createTextNode("Borrar");
			a.appendChild(linkText);
			a.onclick = function () {
				$.ajax({
				    url: 'rest/services/asignatura/' + idAsignatura,
				    type: 'DELETE',
				    dataType: "json",
				    success: function(result) {
				    	document.getElementById(idAsignatura).outerHTML = "";
				    },
			    	error: function(jqXhr, textStatus, errorMessage){
				    	alert('error');	
				    }
				});
			};
			entry.id = idAsignatura;
			entry.appendChild(document.createTextNode("("+ idAsignatura + ") " + nombreAsignatura));
			entry.appendChild(a);
			$('#listadoAsignaturas').append(entry);
		}

		//Insertar Asignatura
		$(document).ready(function(){
			$("#sendButtonAsignatura").click(function(){
				var sendInfo = {idAsignatura: $('#idAsignatura').val(), nombreAsignatura: $('#nombreAsignatura').val()};
			    $.ajax({
					    url: 'rest/services/asignatura/',
					    headers: { 
				               'Accept': 'application/json',
				               'Content-Type': 'application/json' 
				           },
					    type: 'POST',
					    dataType: "json", 
					    success: function(result) {
					    	if(result)
					    		loadAsignatura(result.idAsignatura, result.nombreAsignatura);
					    	else
					    		alert("Ya existe una asignatura con ese id");
					    },
				    	error: function(jqXhr, textStatus, errorMessage){
					    	alert('Error: ' + jqXhr.responseJSON.resultado);	
					    },
					    data:  JSON.stringify(sendInfo)
					});
			    });
			
			//Update Asignatura
			$("#updateButtonAsignatura").click(function(){
				var sendInfo = {idAsignatura: $('#idAsignatura').val(), nombreAsignatura: $('#nombreAsignatura').val()};
			    $.ajax({
					    url: 'rest/services/asignatura/',
					    headers: { 
				               'Accept': 'application/json',
				               'Content-Type': 'application/json' 
				           },
					    type: 'PUT',
					    dataType: "json", 
					    success: function(result) {
					    	if(result) {
					    		document.getElementById(result.idAsignatura).outerHTML = "";
					    		loadAsignatura(result.idAsignatura, result.nombreAsignatura);
					    	}
					    	else
					    		alert("No existe una asignatura con ese id");
					    },
				    	error: function(jqXhr, textStatus, errorMessage){
					    	alert('Error: ' + jqXhr.responseJSON.resultado);	
					    },
					    data:  JSON.stringify(sendInfo)
					});
			    });
			
			//GET Asignatura
			$.ajax({
			    url: 'rest/services/asignatura/',
			    type: 'GET',
			    dataType: "json",
			    success: function(result) {
			    	jQuery.each(result.asignaturas, function(i, val) {
			    		  loadAsignatura(val.idAsignatura, val.nombreAsignatura);
			    		});
			    }
			});
		});
		
		//loadTurno
		function loadTurno(idTurno, nombreTurno){
			var entry = document.createElement('li');
			var a = document.createElement('button');
			var linkText = document.createTextNode("Borrar");
			a.appendChild(linkText);
			a.onclick = function () {
				$.ajax({
				    url: 'rest/services/turno/' + idTurno,
				    type: 'DELETE',
				    dataType: "json",
				    success: function(result) {
				    	document.getElementById(idTurno).outerHTML = "";
				    },
			    	error: function(jqXhr, textStatus, errorMessage){
				    	alert('error');	
				    }
				});
			};
			entry.id = idTurno;
			entry.appendChild(document.createTextNode("("+ idTurno + ") " + nombreTurno));
			entry.appendChild(a);
			$('#listadoTurnos').append(entry);
		}

		//Insertar Turno
		$(document).ready(function(){
			$("#sendButtonTurno").click(function(){
				var sendInfo = {idTurno: $('#idTurno').val(), nombreTurno: $('#nombreTurno').val()};
			    $.ajax({
					    url: 'rest/services/turno/',
					    headers: { 
				               'Accept': 'application/json',
				               'Content-Type': 'application/json' 
				           },
					    type: 'POST',
					    dataType: "json", 
					    success: function(result) {
					    	if(result)
					    		loadTurno(result.idTurno, result.nombreTurno);
					    	else
					    		alert("Ya existe un turno con ese id");
					    },
				    	error: function(jqXhr, textStatus, errorMessage){
					    	alert('Error: ' + jqXhr.responseJSON.resultado);	
					    },
					    data:  JSON.stringify(sendInfo)
					});
			    });
			
			//Update Turno
			$("#updateButtonTurno").click(function(){
				var sendInfo = {idTurno: $('#idTurno').val(), nombreTurno: $('#nombreTurno').val()};
			    $.ajax({
					    url: 'rest/services/turno/',
					    headers: { 
				               'Accept': 'application/json',
				               'Content-Type': 'application/json' 
				           },
					    type: 'PUT',
					    dataType: "json", 
					    success: function(result) {
					    	if(result) {
					    		document.getElementById(result.idTurno).outerHTML = "";
					    		loadTurno(result.idTurno, result.nombreTurno);
					    	}
					    	else
					    		alert("No existe un turno con ese id");
					    },
				    	error: function(jqXhr, textStatus, errorMessage){
					    	alert('Error: ' + jqXhr.responseJSON.resultado);	
					    },
					    data:  JSON.stringify(sendInfo)
					});
			    });
			
			//GET Turno
			$.ajax({
			    url: 'rest/services/turno/',
			    type: 'GET',
			    dataType: "json",
			    success: function(result) {
			    	jQuery.each(result.turnos, function(i, val) {
			    		  loadTurno(val.idTurno, val.nombreTurno);
			    		});
			    }
			});
		});
		
		//loadAsignaturaAddTurno
		function loadAsignaturaAddTurno(idTurno, nombreTurno, idAsignatura, nombreAsignatura){
			var entry = document.createElement('li');
			entry.id = idAsignatura;
			entry.appendChild(document.createTextNode("("+ idTurno + ") " + nombreTurno + " - ("+ idAsignatura + ") " + nombreAsignatura));
			$('#listadoAsignaturasTurnos').append(entry);
		}
		
		//Asignar Asignatura a Turno
		$(document).ready(function(){
			$("#asignarButton").click(function(){
				var sendInfo = {
					idTurno: $('#idTurnoAsignar').val(),
					idAsignatura: $('#idAsignaturaAsignar').val()
				};
			    $.ajax({
					    url: 'rest/services/asignar/',
					    headers: { 
				               'Accept': 'application/json',
				               'Content-Type': 'application/json' 
				           },
					    type: 'POST',
					    dataType: "json", 
					    success: function(result) {
					    	if(result)
					    		loadAsignaturaAddTurno(result.idTurno, result.nombreTurno, result.idAsignatura, result.nombreAsignatura);
					    	else
					    		alert("Error al asignar la asignatura al turno.");
					    },
				    	error: function(jqXhr, textStatus, errorMessage){
					    	alert('Error al asignar la asignatura al turno.');
					    },
					    data:  JSON.stringify(sendInfo)
					});
			    });
			
			//GET AsignaturaAddTurno
			$.ajax({
			    url: 'rest/services/asignar/',
			    type: 'GET',
			    dataType: "json",
			    success: function(result) {
			    	jQuery.each(result.asignaturas, function(i, val) {
			    		  loadAsignaturaAddTurno(val.idTurno, val.nombreTurno, val.idAsignatura, val.nombreAsignatura);
			    		});
			    }
			});
		});
	</script>
</head>
<body>
	<h1>API REST UCAM</h1>
	<h2>Insertar asignatura</h2>
	<form>
		<label for="idAsignatura">ID Asignatura:</label>
		<input type="text" id="idAsignatura"><br>
		<label for="nombreAsignatura">Nombre Asignatura:</label>
		<input type="text" id="nombreAsignatura"><br>
		<button type="button" id="sendButtonAsignatura">Insertar</button>
		<button type="button" id="updateButtonAsignatura">Actualizar</button>
	</form>
	<ul id="listadoAsignaturas"></ul>
	
	<h2>Insertar turno</h2>
	<form>
		<label for="idTurno">ID Turno:</label>
		<input type="text" id="idTurno"><br>
		<label for="nombreTurno">Nombre Turno:</label>
		<input type="text" id="nombreTurno"><br>
		<button type="button" id="sendButtonTurno">Insertar</button>
		<button type="button" id="updateButtonTurno">Actualizar</button>
	</form>
	<ul id="listadoTurnos"></ul>
	
	<h2>Asignar asignatura a turno</h2>
	<form>
		<label for="idTurnoAsignar">ID Turno:</label>
		<input type="text" id="idTurnoAsignar"><br>
		<label for="idAsignaturaAsignar">ID Asignatura:</label>
		<input type="text" id="idAsignaturaAsignar"><br>
		<button type="button" id="asignarButton">Asignar</button>
	</form>
	<ul id="listadoAsignaturasTurnos"></ul>
</body>
</html>
