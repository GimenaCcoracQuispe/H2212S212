package PruebaProduct;

import Maestros.CrudProduct;


public class EliminarProduct {
	public static void main(String[] args) {
		try {
			// Datos
			String id = "11";
			// Proceso
			CrudProduct productService = new CrudProduct();
			productService.delete(id);
			System.out.println("Registro eliminado.");
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}

}
//WENA
