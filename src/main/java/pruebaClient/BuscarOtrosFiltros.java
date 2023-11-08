package pruebaClient;

import java.util.List;
import Modelos.client;
import Maestros.CrudClient;

public class BuscarOtrosFiltros {
	public static void main(String[] args) {
		try {
			// Datos
			client bean = new client();
			bean.setNames("Juancito");
			bean.setLastname("    ");
			bean.setType_document("    ");
			bean.setNumber_document(" ");
			// Proceso
			CrudClient clientService = new CrudClient();
			List<client> lista = clientService.get(bean);
			for (client client : lista) {
				System.out.println(client);
			}
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}
}
