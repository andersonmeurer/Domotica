package br.com.domotica.principal;

import br.com.domotica.dao.DAOConfiguracao;
import br.com.gam.gamUtilCD.Arquivos;

public class Principal {
	public static void main(String[] args) {
		if (!Arquivos.isExisteAplicacaoEmExecucao()) {
//			new TelaPrincipal();
			new DAOConfiguracao();
		}
	}
}