package pruebaClient;

import Maestros.CrudClient;

public class ActivarClient {

    public static void main(String[] args) {
        try {
            // Datos
            String id = "14";
            // Proceso
            CrudClient studentService = new CrudClient();
            studentService.active(id);
            System.out.println("Registro activado.");
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
    }
}
