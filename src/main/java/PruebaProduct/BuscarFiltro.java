package PruebaProduct;

import java.util.List;

import Maestros.CrudProduct;
import Modelos.product;

public class BuscarFiltro {
	 public static void main(String[] args) {
	        try {
	            // Datos
	        	product bean = new product();
	            bean.setCode("");
	            bean.setDescription("");

	            // Proceso
	            CrudProduct productService = new CrudProduct();
	            List<product> lista = productService.get(bean);
	            for (product product : lista) {
	                System.out.println(product);
	            }
	        } catch (Exception e) {
	            System.err.println(e.getMessage());
	        }
    }
}

