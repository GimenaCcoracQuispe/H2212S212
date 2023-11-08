package pruebaClient;

import Modelos.client;
import Maestros.CrudClient;
public class CrearClient {
	
	public static void main(String[] args) {
		try {
			// Datos
			client bean = new client(null, "Roberto", "Arias", "982114258", "Lizz@gmail.com","DNI", "734567389", null);
			// Proceso
			CrudClient studentService = new CrudClient();
			studentService.insert(bean);
			System.out.println(bean);
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}
}
