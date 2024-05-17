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
		
		//Asignar Asignatura a Turno
        $("#asignarButton").click(function(){
        	
        	var sendInfo = {idTurno: $('#idTurno').val(), nombreTurno: $('#nombreTurno').val()};
        	var sendInfo = {idAsignatura: $('#idAsignatura').val(), nombreAsignatura: $('#nombreAsignatura').val()};
        	
            $.ajax({
                url: 'rest/services/asignar/',
                headers: { 
                    'Accept': 'application/json',
                    'Content-Type': 'application/json' 
                },
                type: 'POST',
                dataType: "json", 
                success: function(result) {
                	if(result) {
			    		document.getElementById(result.idTurno).outerHTML = "";
			    		loadAsignatura(result.idAsignatura, result.nombreAsignatura);
			    		loadTurno(result.idTurno, result.nombreTurno);
			    	}
                },
                error: function(jqXhr, textStatus, errorMessage){
                    alert('Error al asignar la asignatura al turno.');
                },
                data:  JSON.stringify(sendInfo)
            });
        });

</script>
	
	
</head>
<body>

	<center><b>GESTIÓN DE EXÁMENES UCAM</b></center>
<br>
	Formulario para insertar un Asignatura<br>
	ID Asignatura:<input type=text id="idAsignatura"><br>
	Nombre Asignatura:<input type=text id="nombreAsignatura"><br>
	<button id="sendButtonAsignatura">Crear Asignatura</button>
	<button id="updateButtonAsignatura">Modificar Asignatura</button>
	
	<br>
	<br>
	Listado de asignaturas creadas
	<br>
	<ul id="listadoAsignaturas"></ul>
<br>
	Formulario para insertar un Turno<br>
	ID Turno:<input type=text id="idTurno"><br>
	Nombre Turno:<input type=text id="nombreTurno"><br>
	<button id="sendButtonTurno">Crear Turno</button>
	<button id="updateButtonTurno">Modificar Turno</button>
	
	<br>
	<br>
	Listado de turnos creados
	<br>
	<ul id="listadoTurnos"></ul>
<br>
    Asignar Asignatura a Turno<br>
    ID Asignatura:<input type=text id="idAsignatura"><br>
    Nombre Asignatura:<input type=text id="nombreAsignatura"><br>
    ID Turno:<input type=text id="idTurno"><br>
    Nombre Turno:<input type=text id="nombreTurno"><br>
   	<button id="asignarButton" id="asignarButton">Asignar</button>

</body>
</html>
