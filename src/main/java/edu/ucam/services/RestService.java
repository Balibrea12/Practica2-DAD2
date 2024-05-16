package edu.ucam.services;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Hashtable;

import org.json.JSONObject;

import edu.ucam.pojos.Asignatura;
import jakarta.ws.rs.Consumes;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;

@Path("/services")
public class RestService {

	private static Hashtable<String, Asignatura> asignaturas = new Hashtable<String, Asignatura>();
	
	@GET
	@Path("/asignatura")
	@Produces(MediaType.APPLICATION_JSON)
	public Response getAsignatura() {
		
		System.out.println("Ejecutando getAsignatura");
		JSONObject jsonRespuesta = new JSONObject();
		
		for (Asignatura asignatura : asignaturas.values()) {
			
			JSONObject jsonAsignatura = new JSONObject();
			jsonAsignatura.put("X", asignatura.getId());
			jsonAsignatura.put("Y", asignatura.getNombre());
			
			jsonRespuesta.append("asignaturas", jsonAsignatura);
		}
		
		return Response.status(200).entity(jsonRespuesta.toString()).build();
	}
	
	@POST
	@Path("/asignatura")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Response postAsignatura(InputStream incomingData) {
		
		StringBuilder sb = new StringBuilder();
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
		Asignatura asignatura = new Asignatura(jsonRecibido.getString("X"), jsonRecibido.getString("Y"));
		
		//Creamos el jsonRespuesta
		JSONObject jsonRespuesta = new JSONObject();
		
		//Añadimos la asignatura a la hashtable
		if(!asignaturas.containsKey(asignatura.getId())) {
			
			asignaturas.put(asignatura.getId(), asignatura);
			jsonRespuesta.put("X", asignatura.getId());
			jsonRespuesta.put("Y", asignatura.getNombre());
			
			return Response.status(200).entity(jsonRespuesta.toString()).build();
		}
		
		//Si ya existe una asignatura, nos devuelve null
		return null;
	}
}
