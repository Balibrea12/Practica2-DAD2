<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Probar API REST</title>
	
	<!-- Se incluye la librería JQuery que facilita interacturar con el DOM de la web -->
	<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
	
	<script type="text/javascript">
	 
		function load(x){
			var entry = document.createElement('li');
			
			var a = document.createElement('a');
						
			var linkText = document.createTextNode(" [Borrar]");
						
			a.appendChild(linkText);
						
			a.onclick = function () {
				$.ajax({
				    url: '/rest/services/asignatura' + X,
				    type: 'DELETE',
				    dataType: "json",
				    success: function(result) {
				    	document.getElementById(X).remove();
				    },
			    	error: function(jqXhr, textStatus, errorMessage){
				    	alert('error');	
				    }
				});
			};
	
			
			entry.id = X;		
			
			entry.appendChild(document.createTextNode("("+ X + ") " + Y + " " + Z));
			 
			entry.appendChild(a);			
			
			$('#users').append(entry);
			
		}
	
		$(document).ready(function(){
			
			$("#sendButton").click(function(){
				
				var sendInfo = {X: $('#X').val(), Y: $('#Y').val()};
				
			    $.ajax({
					    url: '/rest/services/asignatura', 
					    headers: { 
				               'Accept': 'application/json',
				               'Content-Type': 'application/json' 
				           },
					    type: 'POST',
					    dataType: "json", 
					    success: function(result) {
					    	load(result.X, result.Y);
					    },
				    	error: function(jqXhr, textStatus, errorMessage){
					    	alert('Error: ' + jqXhr.responseJSON.resultado);	
					    },
					    data:  JSON.stringify(sendInfo)
					    
					});
			    });
		
			
			$.ajax({
			    url: '/rest/services/asignatura',
			    type: 'GET',
			    dataType: "json",
			    success: function(result) {
					jQuery.each(result.asignaturas, function(i, val) {
			    		  load(val.X, val.Y);
			    		});
			    }
			});
		});
</script>
	
	
</head>
<body>

	<center><b>Ejemplo API Rest</b></center><br>
	Formulario para insertar X<br>
	X:<input type=text id="X"><br>
	Y:<input type=text id="Y"><br>
	<button id="sendButton">Crear Asignatura</button>
	
	<br>
	<br>
	Listado de X creados
	<br>
	<ul id="X"></ul>
</body>
</html>