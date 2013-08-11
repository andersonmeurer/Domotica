package br.com.domotica.web.services;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.ws.rs.GET;
import javax.ws.rs.Path;

@Path("/teste")
public class TesteService {

	@GET
	public String digaOla() {
		return "Ol�";
	}
	
	@Path("/data")
	@GET
	public String digaData() {
		Date hoje = new Date();
		
		StringBuilder sb = new StringBuilder();
		sb.append("Hoje � dia ");
		sb.append(new SimpleDateFormat("dd 'de' MMMMM 'de' yyyy").format(hoje));
		sb.append("!");
		
		return sb.toString();
	}
	
	@Path("/horas")
	@GET
	public String digaAsHoras() {
		Date agora = new Date();
		
		StringBuilder sb = new StringBuilder();
		sb.append("Agora s�o ");
		sb.append(new SimpleDateFormat("hh 'hora(s),' mm 'minuto(s) e' ss 'segundo(s)'").format(agora));
		sb.append("!");
		
		return sb.toString();
	}
	
}
