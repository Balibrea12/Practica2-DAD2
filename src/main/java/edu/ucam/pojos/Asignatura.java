package edu.ucam.pojos;

public class Asignatura {

	protected String idAsignatura;
	protected String nombreAsignatura;
	private Turno turno;
	
	public Asignatura(String idAsignatura, String nombreAsignatura) {
		this.idAsignatura = idAsignatura;
		this.nombreAsignatura = nombreAsignatura;
	}

	public String getIdAsignatura() {
		return idAsignatura;
	}

	public void setIdAsignatura(String idAsignatura) {
		this.idAsignatura = idAsignatura;
	}

	public String getNombreAsignatura() {
		return nombreAsignatura;
	}

	public void setNombreAsignatura(String nombreAsignatura) {
		this.nombreAsignatura = nombreAsignatura;
	}

	public Turno getTurno() {
		return turno;
	}

	public void setTurno(Turno turno) {
		this.turno = turno;
	}
}
