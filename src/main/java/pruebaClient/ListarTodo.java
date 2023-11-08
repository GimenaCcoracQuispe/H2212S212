package pruebaClient;

import java.util.List;

import Modelos.client;
import Maestros.CrudClient;

public class ListarTodo {
	public static void main(String[] args) {
		try {
			CrudClient clientService = new CrudClient();
			List<client> lista = clientService.getAll();
			for (client client : lista) {
					System.out.println(client);
				}
			
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}
}
