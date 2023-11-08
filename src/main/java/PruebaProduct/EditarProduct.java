package PruebaProduct;

import Maestros.CrudProduct;
import Modelos.product;

public class EditarProduct {
    public static void main(String[] args) {
        try {
            CrudProduct productService = new CrudProduct();

            // Datos del producto a editar
            String code = "14558962320"; // Código del producto que deseas editar
            String description = "KAIAK OCEANO";
            Integer stock = 50;
            double points = 23.00;
            String name = "Nombre del Producto";
            String type = "Tipo de Producto";
            String brand = "Marca del Producto";
            String state = "Estado del Producto";

            // Verificar si el producto con el código existe
            product existingProduct = productService.getForId(code);

            if (existingProduct != null) {
                // El producto existe, entonces actualízalo
                existingProduct.setDescription(description);
                existingProduct.setStock(stock);
                existingProduct.setPoints(points);
                existingProduct.setName(name);
                existingProduct.setType(type);
                existingProduct.setBrand(brand);
                existingProduct.setState(state);

                productService.update(existingProduct);
                System.out.println("Producto actualizado con éxito: " + existingProduct);
            } else {
                System.out.println("El producto con código " + code + " no existe en la base de datos. No se pudo editar.");
            }
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
    }
}
