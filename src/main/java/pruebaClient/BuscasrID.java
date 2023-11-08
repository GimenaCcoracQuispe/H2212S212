package pruebaClient;

import Modelos.client;
import Maestros.CrudClient;

public class BuscasrID {
		public static void main(String[] args) {
			try {
				CrudClient studentService = new CrudClient();
				client bean = studentService.getForId("14");
				System.out.println(bean);
			} catch (Exception e) {
				System.err.println(e.getMessage());
			}
		}
}
