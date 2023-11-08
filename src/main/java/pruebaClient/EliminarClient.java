package pruebaClient;

import Maestros.CrudClient;

public class EliminarClient {

	public static void main(String[] args) {
		try {
			// Datos
			String id = "14";
			// Proceso
			CrudClient studentService = new CrudClient();
			studentService.delete(id);
			System.out.println("Registro eliminado.");
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}
}
