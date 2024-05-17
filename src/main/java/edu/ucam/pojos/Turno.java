package edu.ucam.pojos;

import java.util.Hashtable;

public class Turno {
	
	protected String idTurno;
	protected String nombreTurno;
	private Hashtable<String, Asignatura> asignaturas;
	
	public Turno(String idTurno, String nombreTurno) {
		this.idTurno = idTurno;
		this.nombreTurno = nombreTurno;
	}

	public String getIdTurno() {
		return idTurno;
	}

	public void setIdTurno(String idTurno) {
		this.idTurno = idTurno;
	}

	public String getNombreTurno() {
		return nombreTurno;
	}

	public void setNombreTurno(String nombreTurno) {
		this.nombreTurno = nombreTurno;
	}

	public Hashtable<String, Asignatura> getAsignaturas() {
		return asignaturas;
	}

	public void setAsignaturas(Hashtable<String, Asignatura> asignaturas) {
		this.asignaturas = asignaturas;
	}
	
	public void addAsignatura(Asignatura asignatura, String idAsignatura) {
		this.asignaturas.put(idAsignatura, asignatura);
	}
}
