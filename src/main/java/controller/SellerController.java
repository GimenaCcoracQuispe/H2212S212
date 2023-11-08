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


import Maestros.CrudSeller;
import Modelos.seller;

@WebServlet({ "/sellerBuscar", "/sellerBuscar2", "/sellerProcesar", "/sellerListar"})

public class SellerController extends HttpServlet {
private static final long serialVersionUID = 1L;
	
	private CrudSeller service = new CrudSeller();
	
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = request.getServletPath();
		switch (path) {
		case "/sellerBuscar":
			buscar(request, response);
			break;
		case "/sellerBuscar2":
			buscar2(request, response);
			break;
		case "/sellerProcesar":
			procesar(request, response);
			break;

		}
	}


	private void procesar(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
				String accion = request.getParameter("accion");
				seller bean = new seller();
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
			    bean.setLastnames(request.getParameter("lastname"));
			    bean.setEmail(request.getParameter("email"));
			    bean.setCellphone(request.getParameter("cellphone"));
			    bean.setSeller_user(request.getParameter("seller_user"));
			    bean.setPassword_user(request.getParameter("password_user"));
			    bean.setDocument_type(request.getParameter("document_type"));
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


	private void buscar2(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
				// Datos
						String names = request.getParameter("names");
						String lastname = request.getParameter("lastname");
						String email = request.getParameter("email");
						String cellphone = request.getParameter("cellphone");
						String seller_user = request.getParameter("seller_user");
						String password_user = request.getParameter("password_user");
						String document_type = request.getParameter("document_type");
						String number_document = request.getParameter("number_document");
						// Proceso
						seller bean = new seller();
						bean.setNames(names);
						bean.setLastnames(lastname);
						bean.setEmail(email);
						bean.setCellphone(cellphone);
						bean.setSeller_user(seller_user);
						bean.setPassword_user(password_user);
						bean.setDocument_type(document_type);
						bean.setNumber_document(number_document);
						List<seller> lista = service.get(bean);
						// Preparando el JSON
						Gson gson = new Gson();
						String data = gson.toJson(lista);
						// Reporte
						ControllerUtil.responseJson(response, data);
	}


		private void buscar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		    // Datos
		    String names = request.getParameter("names");
		    String lastname = request.getParameter("lastname");
		    // Proceso
		    seller bean = new seller(); // Corregido el nombre de la clase
		    bean.setNames(names); // Usar la variable real en lugar de la cadena "names"
		    bean.setLastnames(lastname); // Usar la variable real en lugar de la cadena "lastname"
		    List<seller> lista = service.get(bean); // Corregido el nombre de la clase
		    // Reporte
		    request.setAttribute("listado", lista);
		    RequestDispatcher rd = request.getRequestDispatcher("ListarSeller.jsp"); // Corregido el nombre de la página JSP
		    rd.forward(request, response);
		}

}
