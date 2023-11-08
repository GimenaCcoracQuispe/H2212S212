package pruebaClient;

import Modelos.client;
import Maestros.CrudClient;

public class ActualizarClient {
	public static void main(String[] args) {
        try {
            // Datos
            int id = 14; // ID del registro que deseas actualizar
            client bean = new client(id, "Rafael", "Rayman", "982114258", "Rafael@gmail.com","DNI", "734567389", null);
            // Proceso
            CrudClient studentService = new CrudClient();
            studentService.update(bean);
            System.out.println(bean);
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
    }
}
