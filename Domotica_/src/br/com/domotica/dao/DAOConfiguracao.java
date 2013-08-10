package br.com.domotica.dao;

import java.io.IOException;
import java.util.Properties;

import br.com.gam.gamUtilCD.Arquivos;
import br.com.gam.log.ETipoMessage;
import br.com.gam.log.Log;

public class DAOConfiguracao {

	
	public DAOConfiguracao() {
		try {
			Properties properties = Arquivos.getPropertiesDoArquivo("./conf/configuracaoPortaSerial.properties");
			
			System.out.println(properties.get("BitsDeDados"));
			System.out.println(properties.get("BitsDeParada"));
			System.out.println(properties.get("Porta"));
			System.out.println(properties.get("ControleFluxo"));
			System.out.println(properties.get("Paridade"));
			System.out.println(properties.get("BitsPorSegundo"));

			System.out.println(1);
		} catch (IOException e) {
			Log.saveLog(this, e, ETipoMessage.ERROR);
		}

	}
}
