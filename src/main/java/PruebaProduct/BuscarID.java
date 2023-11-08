package PruebaProduct;

import Maestros.CrudProduct;
import Modelos.product;

public class BuscarID {
	public static void main(String[] args) {
		try {
			CrudProduct productService = new CrudProduct();
			product bean = productService.getForId("1");
			System.out.println(bean);
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}
}
