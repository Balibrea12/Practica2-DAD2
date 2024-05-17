package edu.ucam.services;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Hashtable;

import org.json.JSONObject;

import edu.ucam.pojos.Asignatura;
import edu.ucam.pojos.Turno;
import jakarta.ws.rs.Consumes;
import jakarta.ws.rs.DELETE;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.PUT;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.PathParam;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;

@Path("/services")
public class RestService {

	private static Hashtable<String, Asignatura> asignaturas = new Hashtable<String, Asignatura>();
	private static Hashtable<String, Turno> turnos = new Hashtable<String, Turno>();
	
	//GET Asignatura
	@GET
	@Path("/asignatura/")
	@Produces(MediaType.APPLICATION_JSON)
	public Response getAsignatura() {
		
		System.out.println("Ejecutando getAsignatura");
		JSONObject jsonRespuesta = new JSONObject();
		
		for (Asignatura asignatura : asignaturas.values()) {
			
			JSONObject jsonAsignatura = new JSONObject();
			jsonAsignatura.put("idAsignatura", asignatura.getIdAsignatura());
			jsonAsignatura.put("nombreAsignatura", asignatura.getNombreAsignatura());
			
			jsonRespuesta.append("asignaturas", jsonAsignatura);
		}
		
		return Response.status(200).entity(jsonRespuesta.toString()).build();
	}
	
	//GET Turno
	@GET
	@Path("/turno/")
	@Produces(MediaType.APPLICATION_JSON)
	public Response getTurno() {
		
		System.out.println("Ejecutando getTurno");
		JSONObject jsonRespuesta = new JSONObject();
		
		for (Turno turno : turnos.values()) {
			
			JSONObject jsonTurno = new JSONObject();
			jsonTurno.put("idTurno", turno.getIdTurno());
			jsonTurno.put("nombreTurno", turno.getNombreTurno());
			
			jsonRespuesta.append("turnos", jsonTurno);
		}
		
		return Response.status(200).entity(jsonRespuesta.toString()).build();
	}
	
	//GET AsignaturaAddTurno
	@GET
	@Path("/asignar/")
	@Produces(MediaType.APPLICATION_JSON)
	public Response getAsignaturaAddTurno() {
		
		System.out.println("Ejecutando getAsignaturaAddTurno");
		JSONObject jsonRespuesta = new JSONObject();
		
		for (Turno turno : turnos.values()) {
			for (Asignatura asignatura : asignaturas.values()) {
				
				JSONObject jsonTurno = new JSONObject();
				JSONObject jsonAsignatura = new JSONObject();
				
				jsonAsignatura.put("idTurno", turno.getIdTurno());
				jsonAsignatura.put("nombreTurno", turno.getNombreTurno());
				
				jsonAsignatura.put("idAsignatura", asignatura.getIdAsignatura());
				jsonAsignatura.put("nombreAsignatura", asignatura.getNombreAsignatura());
				
				jsonRespuesta.append("asignaturas", jsonAsignatura);
				jsonRespuesta.append("turnos", jsonTurno);
			}
		}
		
		return Response.status(200).entity(jsonRespuesta.toString()).build();
	}
	
	//POST Asignatura
	@POST
	@Path("/asignatura/")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Response postAsignatura(InputStream incomingData) {
		
		StringBuilder sb = new StringBuilder();
		System.out.println("Ejecutando postAsignatura");
		
		try {
			BufferedReader in = new BufferedReader(new InputStreamReader(incomingData));
			String line = null;
			
			while ((line = in.readLine()) != null) {
				sb.append(line);
			}
			
		} catch (Exception e) {
			System.out.println("Error Parsing: - ");
		}

		JSONObject jsonRecibido = new JSONObject(sb.toString());
		
		//Creamos el objeto Asignatura con los datos que hemos recibido
		Asignatura asignatura = new Asignatura(jsonRecibido.getString("idAsignatura"), jsonRecibido.getString("nombreAsignatura"));
		
		//Creamos el jsonRespuesta
		JSONObject jsonRespuesta = new JSONObject();
		
		//Añadimos la asignatura a la hashtable
		if(!asignaturas.containsKey(asignatura.getIdAsignatura())) {
			
			asignaturas.put(asignatura.getIdAsignatura(), asignatura);
			jsonRespuesta.put("idAsignatura", asignatura.getIdAsignatura());
			jsonRespuesta.put("nombreAsignatura", asignatura.getNombreAsignatura());
			
			return Response.status(200).entity(jsonRespuesta.toString()).build();
		}
		
		//Si ya existe una asignatura, nos devuelve null
		return null;
	}
	
	//POST Turno
	@POST
	@Path("/turno/")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Response postTurno(InputStream incomingData) {
		
		StringBuilder sb = new StringBuilder();
		System.out.println("Ejecutando postTurno");
		
		try {
			BufferedReader in = new BufferedReader(new InputStreamReader(incomingData));
			String line = null;
			
			while ((line = in.readLine()) != null) {
				sb.append(line);
			}
			
		} catch (Exception e) {
			System.out.println("Error Parsing: - ");
		}

		JSONObject jsonRecibido = new JSONObject(sb.toString());
		
		//Creamos el objeto Turno con los datos que hemos recibido
		Turno turno = new Turno(jsonRecibido.getString("idTurno"), jsonRecibido.getString("nombreTurno"));
		
		//Creamos el jsonRespuesta
		JSONObject jsonRespuesta = new JSONObject();
		
		//Añadimos el turno a la hashtable
		if(!turnos.containsKey(turno.getIdTurno())) {
			
			turnos.put(turno.getIdTurno(), turno);
			jsonRespuesta.put("idTurno", turno.getIdTurno());
			jsonRespuesta.put("nombreTurno", turno.getNombreTurno());
			
			return Response.status(200).entity(jsonRespuesta.toString()).build();
		}
		
		//Si ya existe el turno, nos devuelve null
		return null;
	}
	
	//POST AsignaturaAddTurno
	@POST
	@Path("/asignar/")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Response postAsignaturaAddTurno(InputStream incomingData) {
		
		StringBuilder sb = new StringBuilder();
		System.out.println("Ejecutando postAsignaturaAddTurno");
		
		try {
			BufferedReader in = new BufferedReader(new InputStreamReader(incomingData));
			String line = null;
			
			while ((line = in.readLine()) != null) {
				sb.append(line);
			}
			
		} catch (Exception e) {
			System.out.println("Error Parsing: - ");
		}

		JSONObject jsonRecibido = new JSONObject(sb.toString());
		
		//Creamos variables de idAsignatura e idTurno
		String idAsignatura = jsonRecibido.getString("idAsignatura");
	    String idTurno = jsonRecibido.getString("idTurno");
		
		//Creamos el jsonRespuesta
		JSONObject jsonRespuesta = new JSONObject();
		
		//Comprobamos que existen tanto la Asignatura como el Turno
		if(asignaturas.containsKey(idAsignatura) && turnos.containsKey(idTurno)) {
			
			//Creamos el objeto asignatura y turno para poder asignar las variables creadas anteriomente
			Asignatura asignatura = asignaturas.get(idAsignatura);
		    Turno turno = turnos.get(idTurno);
		    
			//Asignamos la asignatura al turno
			asignatura.setTurno(turno);
			turno.addAsignatura(asignatura, idAsignatura);
			
			jsonRespuesta.put("idAsignatura", asignatura.getIdAsignatura());
			jsonRespuesta.put("nombreAsignatura", asignatura.getNombreAsignatura());
			jsonRespuesta.put("idTurno", turno.getIdTurno());
			jsonRespuesta.put("nombreTurno", turno.getNombreTurno());
			
			return Response.status(200).entity(jsonRespuesta.toString()).build();
		}
		
		//Si no existe un turno o una asignatura con ese id, nos devuelve null
		return null;
	}
	
	//DELETE Asignatura
	@DELETE
	@Path("/asignatura/{idAsignatura}")
	@Produces(MediaType.APPLICATION_JSON)
	public Response deleteAsignatura(@PathParam("idAsignatura") String idAsignatura) {
		
		System.out.println("Ejecutando deleteAsignatura");
		JSONObject jsonRespuesta = new JSONObject();
		
		if(asignaturas.containsKey(idAsignatura)) {
			
			asignaturas.remove(idAsignatura);
			jsonRespuesta.append("resultado", "Borrado");
			
			return Response.ok().entity(jsonRespuesta.toString()).build();
		}
		
		//Si no existe la asignatura con ese id no se borraría
		return null;
	}
	
	//DELETE Turno
	@DELETE
	@Path("/turno/{idTurno}")
	@Produces(MediaType.APPLICATION_JSON)
	public Response deleteTurno(@PathParam("idTurno") String idTurno) {
		
		System.out.println("Ejecutando deleteTurno");
		JSONObject jsonRespuesta = new JSONObject();
		
		if(turnos.containsKey(idTurno)) {
			
			turnos.remove(idTurno);
			jsonRespuesta.append("resultado", "Borrado");
			
			return Response.ok().entity(jsonRespuesta.toString()).build();
		}
		
		//Si no existe el turno con ese id no se borraría
		return null;
	}
	
	//PUT Asignatura
	@PUT
	@Path("/asignatura/")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Response putAsignatura(InputStream incomingData) {
		
		StringBuilder sb = new StringBuilder();
		System.out.println("Ejecutando putAsignatura");
		
		try {
			BufferedReader in = new BufferedReader(new InputStreamReader(incomingData));
			String line = null;
			
			while ((line = in.readLine()) != null) {
				sb.append(line);
			}
			
		} catch (Exception e) {
			System.out.println("Error Parsing: - ");
		}

		JSONObject jsonRecibido = new JSONObject(sb.toString());
		
		//Creamos el objeto Asignatura con los datos que hemos recibido
		Asignatura asignatura = new Asignatura(jsonRecibido.getString("idAsignatura"), jsonRecibido.getString("nombreAsignatura"));
		
		//Creamos el jsonRespuesta
		JSONObject jsonRespuesta = new JSONObject();
		
		//Añadimos la asignatura a la hashtable
		if(asignaturas.containsKey(asignatura.getIdAsignatura())) {
			
			asignaturas.replace(asignatura.getIdAsignatura(), asignatura);
			jsonRespuesta.put("idAsignatura", asignatura.getIdAsignatura());
			jsonRespuesta.put("nombreAsignatura", asignatura.getNombreAsignatura());
			
			return Response.status(200).entity(jsonRespuesta.toString()).build();
		}
		
		//Si no existe una asignatura con ese id, nos devuelve null
		return null;
	}
	
	//PUT Turno
	@PUT
	@Path("/turno/")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Response putTurno(InputStream incomingData) {
		
		StringBuilder sb = new StringBuilder();
		System.out.println("Ejecutando putTurno");
		
		try {
			BufferedReader in = new BufferedReader(new InputStreamReader(incomingData));
			String line = null;
			
			while ((line = in.readLine()) != null) {
				sb.append(line);
			}
			
		} catch (Exception e) {
			System.out.println("Error Parsing: - ");
		}

		JSONObject jsonRecibido = new JSONObject(sb.toString());
		
		//Creamos el objeto Turno con los datos que hemos recibido
		Turno turno = new Turno(jsonRecibido.getString("idTurno"), jsonRecibido.getString("nombreTurno"));
		
		//Creamos el jsonRespuesta
		JSONObject jsonRespuesta = new JSONObject();
		
		//Añadimos el turno a la hashtable
		if(turnos.containsKey(turno.getIdTurno())) {
			
			turnos.replace(turno.getIdTurno(), turno);
			jsonRespuesta.put("idTurno", turno.getIdTurno());
			jsonRespuesta.put("nombreTurno", turno.getNombreTurno());
			
			return Response.status(200).entity(jsonRespuesta.toString()).build();
		}
		
		//Si no existe un turno con ese id, nos devuelve null
		return null;
	}
	
}
