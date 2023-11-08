package PruebaProduct;

import java.util.List; // Importar la clase List correcta
import Maestros.CrudProduct;
import Modelos.product;

public class ListarProduct {
    public static void main(String[] args) {
        try {
            CrudProduct productService = new CrudProduct();
            List<product> lista = productService.getAll();
            for (product producto : lista) {
                System.out.println(producto);
            }

        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
    }
}
