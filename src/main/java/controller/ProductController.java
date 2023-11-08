package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import Modelos.product;
import Maestros.CrudProduct;

@WebServlet({ "/productBuscar", "/productBuscar2", "/productProcesar", "/productListar" })
public class ProductController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private CrudProduct service = new CrudProduct();

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = request.getServletPath();
        switch (path) {
            case "/productBuscar":
                buscar(request, response);
                break;
            case "/productBuscar2":
                buscar2(request, response);
                break;
            case "/productProcesar":
                procesar(request, response);
                break;
        }
    }

    private void procesar(HttpServletRequest request, HttpServletResponse response) {
        // Datos
        String accion = request.getParameter("accion");
        product bean = new product();

        String codeParam = request.getParameter("code");
        if (codeParam != null && !codeParam.isEmpty()) {
            bean.setCode(codeParam);
        } else {
            // Manejo de error si el valor de code es nulo o vacío
            ControllerUtil.responseJson(response, "El valor de code no puede estar vacío.");
            return;
        }

        bean.setDescription(request.getParameter("description"));
        bean.setStock(Integer.parseInt(request.getParameter("stock")));
        bean.setPoints(Double.parseDouble(request.getParameter("points")));
        bean.setName(request.getParameter("name"));
        bean.setType(request.getParameter("type"));
        bean.setBrand(request.getParameter("brand"));
        bean.setState(request.getParameter("state"));

        // Proceso
        try {
            switch (accion) {
                case ControllerUtil.CRUD_NUEVO:
                    service.insert(bean);
                    break;
                case ControllerUtil.CRUD_EDITAR:
                    service.update(bean);
                    break;
                case ControllerUtil.CRUD_ELIMINAR:
                    service.updateStatus(bean.getCode());
                    break;
                default:
                    throw new IllegalArgumentException("Valor inesperado: " + accion);
            }
            ControllerUtil.responseJson(response, "Proceso exitoso.");
        } catch (Exception e) {
            ControllerUtil.responseJson(response, e.getMessage());
        }
    }

    private void buscar2(HttpServletRequest request, HttpServletResponse response) {
        // Datos
        String code = request.getParameter("code");
        String description = request.getParameter("description");
        Integer stock = Integer.parseInt(request.getParameter("stock"));
        Double points = Double.parseDouble(request.getParameter("points"));
        String name = request.getParameter("name");
        String type = request.getParameter("type");
        String brand = request.getParameter("brand");
        String state = request.getParameter("state");

        // Proceso
        product bean = new product();
        bean.setCode(code);
        bean.setDescription(description);
        bean.setStock(stock);
        bean.setPoints(points);
        bean.setName(name);
        bean.setType(type);
        bean.setBrand(brand);
        bean.setState(state);

        List<product> lista = service.get(bean);

        // Preparando el JSON
        Gson gson = new Gson();
        String data = gson.toJson(lista);

        // Reporte
        ControllerUtil.responseJson(response, data);
    }

    private void buscar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Datos
        String code = request.getParameter("code");
        String description = request.getParameter("description");

        // Proceso
        product bean = new product();
        bean.setCode(code);
        bean.setDescription(description);

        List<product> lista = service.get(bean);

        // Reporte
        request.setAttribute("listado", lista);
        RequestDispatcher rd = request.getRequestDispatcher("ListarProduct.jsp");
        rd.forward(request, response);
    }
}
