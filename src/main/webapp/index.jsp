<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>API REST UCAM</title>
	<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
	
	<script type="text/javascript">
		//loadAsignatura
		function loadAsignatura(idAsignatura, nombreAsignatura){
			var entry = document.createElement('li');
			var a = document.createElement('button');
			var linkText = document.createTextNode(" [Borrar]");
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
			var linkText = document.createTextNode(" [Borrar]");
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
		ID Asignatura: <input type="text" id="idAsignatura"><br>
		Nombre Asignatura: <input type="text" id="nombreAsignatura"><br>
		<button type="button" id="sendButtonAsignatura">Insertar</button>
		<button type="button" id="updateButtonAsignatura">Actualizar</button>
	</form>
	<ul id="listadoAsignaturas">
	</ul>
	
	<h2>Insertar turno</h2>
	<form>
		ID Turno: <input type="text" id="idTurno"><br>
		Nombre Turno: <input type="text" id="nombreTurno"><br>
		<button type="button" id="sendButtonTurno">Insertar</button>
		<button type="button" id="updateButtonTurno">Actualizar</button>
	</form>
	<ul id="listadoTurnos">
	</ul>
	
	<h2>Asignar asignatura a turno</h2>
	<form>
		ID Turno: <input type="text" id="idTurnoAsignar"><br>
		ID Asignatura: <input type="text" id="idAsignaturaAsignar"><br>
		<button type="button" id="asignarButton">Asignar</button>
	</form>
	<ul id="listadoAsignaturasTurnos">
	</ul>
</body>
</html>