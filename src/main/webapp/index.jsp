<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Probar API REST</title>
	<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
	
	<script type="text/javascript">
	
		function load(idAsignatura, nombreAsignatura){
        
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
	
		$(document).ready(function(){
        
			$("#sendButton").click(function(){
            
				var sendInfo = {idAsignatura: $('#idAsignatura').val(), nombreAsignatura: $('#nombreAsignatura').val()};
				
			    $.ajax({
					    url: 'rest/services/asignatura',
					    headers: { 
				               'Accept': 'application/json',
				               'Content-Type': 'application/json' 
				           },
					    type: 'POST',
					    dataType: "json", 
					    success: function(result) {
					    	if(result)
					    		load(result.idAsignatura, result.nombreAsignatura);
					    	else
					    		alert("Ya existe una asignatura con ese id");
					    },
				    	error: function(jqXhr, textStatus, errorMessage){
					    	alert('Error: ' + jqXhr.responseJSON.resultado);	
					    },
					    data:  JSON.stringify(sendInfo)
					    
					});
			    });
			
			$("#updateButton").click(function(){
	            
				var sendInfo = {idAsignatura: $('#idAsignatura').val(), nombreAsignatura: $('#nombreAsignatura').val()};
				
			    $.ajax({
					    url: 'rest/services/asignatura',
					    headers: { 
				               'Accept': 'application/json',
				               'Content-Type': 'application/json' 
				           },
					    type: 'PUT',
					    dataType: "json", 
					    success: function(result) {
					    	if(result) {
					    		document.getElementById(result.idAsignatura).outerHTML = "";
					    		load(result.idAsignatura, result.nombreAsignatura);
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
		
			$.ajax({
			    url: 'rest/services/asignatura',
			    type: 'GET',
			    dataType: "json",
			    success: function(result) {
			    	jQuery.each(result.asignaturas, function(i, val) {
			    		  load(val.idAsignatura, val.nombreAsignatura);
			    		});
			    }
			});
		});
</script>
	
	
</head>
<body>

	<center><b>Ejemplo API Rest</b></center>
<br>
	Formulario para insertar<br>
	ID Asignatura:<input type=text id="idAsignatura"><br>
	Nombre Asignatura:<input type=text id="nombreAsignatura"><br>
	<button id="sendButton">Crear Asignatura</button>
	<button id="updateButton">Modificar Asignatura</button>
	
	<br>
	<br>
	Listado de asignaturas creadas
	<br>
	<ul id="listadoAsignaturas"></ul>

</body>
</html>
