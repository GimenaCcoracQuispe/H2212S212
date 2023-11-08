package controller;

//Importaciones 
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import Modelos.client;
import Maestros.CrudClient;


@WebServlet({ "/clientBuscar", "/clientBuscar2", "/clientProcesar", "/clientListar"})
public class ClientController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	private CrudClient service = new CrudClient();
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = request.getServletPath();
		switch (path) {
		case "/clientBuscar":
			buscar(request, response);
			break;
		case "/clientBuscar2":
			buscar2(request, response);
			break;
		case "/clientProcesar":
			procesar(request, response);
			break;

		}
	}


	private void procesar(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String accion = request.getParameter("accion");
		client bean = new client();
	    bean.setId(0); // Valor predeterminado para el caso de id vacío
	    
	    String idParam = request.getParameter("id");
	    if (idParam != null && !idParam.isEmpty()) {
	        try {
	            bean.setId(Integer.parseInt(idParam));
	        } catch (NumberFormatException e) {
	            // Manejo de error si el valor de id no es un número válido
	            ControllerUtil.responseJson(response, "El valor de id no es válido.");
	            return;
	        }
	    }
	    
	   
	    bean.setNames(request.getParameter("names"));
	    bean.setLastname(request.getParameter("lastname"));
	    bean.setEmail(request.getParameter("email"));
	    bean.setCellphone(request.getParameter("cellphone"));
	    bean.setEmail(request.getParameter("email"));
	    bean.setType_document(request.getParameter("type_document"));
	    bean.setNumber_document(request.getParameter("number_document"));
	    bean.setStatus(request.getParameter("status"));
	    
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
	                service.updateStatus(bean.getId().toString());
	                break;
	            default:
	                throw new IllegalArgumentException("Unexpected value: " + accion);
	        }
	        ControllerUtil.responseJson(response, "Proceso ok.");
	    } catch (Exception e) {
	        ControllerUtil.responseJson(response, e.getMessage());
	    }
	}
	
	private void buscar(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// Datos
				String names = request.getParameter("names");
				String last_names = request.getParameter("lastname");
				// Proceso
				client bean = new client();
				bean.setNames(last_names);
				bean.setLastname(names);
				List<client> lista = service.get(bean);
				// Reporte
				request.setAttribute("listado", lista);
				RequestDispatcher rd = request.getRequestDispatcher("Listarclient.jsp");
				rd.forward(request, response);
	}

	private void buscar2(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// Datos
				String names = request.getParameter("names");
				String lastname = request.getParameter("lastname");
				String cellphone = request.getParameter("cellphone");
				String email = request.getParameter("email");
				String type_document = request.getParameter("type_document");
				String number_document = request.getParameter("number_document");
				// Proceso
				client bean = new client();
				bean.setNames(names);
				bean.setLastname(lastname);
				bean.setCellphone(cellphone);
				bean.setEmail(email);
				bean.setType_document(type_document);
				bean.setNumber_document(number_document);
				List<client> lista = service.get(bean);
				// Preparando el JSON
				Gson gson = new Gson();
				String data = gson.toJson(lista);
				// Reporte
				ControllerUtil.responseJson(response, data);
	}

}
