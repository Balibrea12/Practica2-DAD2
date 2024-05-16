package edu.ucam.pojos;

public class Turno {
	
	protected String idTurno;
	protected String nombreTurno;
	
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

}
