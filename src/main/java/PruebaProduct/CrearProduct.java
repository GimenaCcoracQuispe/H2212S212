package PruebaProduct;

import Maestros.CrudProduct;
import Modelos.product;

public class CrearProduct {
    public static void main(String[] args) {
        try {
            // Datos
            product bean = new product();
            bean.setCode("PRO002");
            bean.setDescription("Iphone 12");
            bean.setStock(8);
            bean.setPoints(23.00);
            bean.setName("Iphone 12");
            bean.setType("CEL");
            bean.setBrand("APPLE");
            bean.setState("A");

            // Proceso
            CrudProduct productService = new CrudProduct();
            productService.insert(bean);
            System.out.println("Producto insertado correctamente.");
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
    }
}
