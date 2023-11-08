package Maestros;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import ACCESODB.ACCESODB;
import Modelos.client;
import service.spec.CrudServiceSpec;
import service.spec.RowMapper;

public class CrudClient implements CrudServiceSpec<client>, RowMapper<client>{
	
	// Definiendo cosas
		private final String SQL_SELECT_BASE = "SELECT id id, names, lastname, cellphone, email, Type_document, number_document, status FROM customer ";
		private final String SQL_INSERT = "INSERT INTO customer(names, lastname, cellphone, email, Type_document, number_document) VALUES(?,?,?,?,?,?)";
		private final String SQL_UPDATE = "UPDATE customer SET names=?,lastname=?,cellphone = ?,email=?,Type_document=?,number_document=? WHERE id = ?";
		
		private final String SQL_DELETE = "UPDATE customer SET status = 'I' WHERE id = ?";
		private final String SQL_ACTIVE = "UPDATE customer SET status = 'A' WHERE id = ?";
		
		@Override
		public List<client> getAll() {
		    // Variables
		    Connection cn = null;
		    List<client> lista = new ArrayList<>();
		    PreparedStatement pstm = null;
		    ResultSet rs = null;
		    client bean;
		    // Proceso
		    try {
		        cn = ACCESODB.getConnection();
		        pstm = cn.prepareStatement(SQL_SELECT_BASE + " WHERE status = 'A'"); // Agrega la condición "WHERE active = 1" para listar solo estudiantes activos
		        rs = pstm.executeQuery();
		        while (rs.next()) {
		            bean = mapRow(rs);
		            lista.add(bean);
		        }
		        rs.close();
		        pstm.close();
		    } catch (SQLException e) {
		        throw new RuntimeException(e.getMessage());
		    } finally {
		        try {
		            cn.close();
		        } catch (Exception e2) {
		        }
		    }
		    return lista;
		}
		
		@Override
		public client getForId(String id) {
			// Variables
			Connection cn = null;
			PreparedStatement pstm = null;
			ResultSet rs = null;
			client bean = null;
			String sql;
			// Proceso
			try {
				cn = ACCESODB.getConnection();
				sql = SQL_SELECT_BASE + " WHERE id=?";
				pstm = cn.prepareStatement(sql);
				pstm.setInt(1, Integer.parseInt(id));
				rs = pstm.executeQuery();
				if (rs.next()) {
					bean = mapRow(rs);
				}
				rs.close();
				pstm.close();
			} catch (SQLException e) {
				throw new RuntimeException(e.getMessage());
			} finally {
				try {
					cn.close();
				} catch (Exception e2) {
				}
			}
			return bean;
		}
		
		/**
		 * Realiza la busqueda por apellido y nombre.
		 */
		@Override

		public List<client> get (client client) {
		    // Variables
		    Connection connection = null;
		    List<client> clientList = new ArrayList<>();
		    PreparedStatement preparedStatement = null;
		    ResultSet resultSet = null;
		    String sql;
		    String names;
		    String lastName;
		    String typeDocument;
		    String numberDocument;
		    // Preparar los datos
		    lastName = "%" + UtilService.setStringVacio(client.getLastname()) + "%";
		    names = "%" + UtilService.setStringVacio(client.getNames()) + "%";
		    typeDocument = "%" + UtilService.setStringVacio(client.getType_document()) + "%";
		    numberDocument = "%" + UtilService.setStringVacio(client.getNumber_document()) + "%";
		    // Proceso
		    try {
		        // Establecer la conexión
		        connection = ACCESODB.getConnection();
		        // Consulta SQL
		        sql = SQL_SELECT_BASE + " WHERE names LIKE ? AND lastname LIKE ? AND type_document LIKE ? AND number_document LIKE ?";
		        preparedStatement = connection.prepareStatement(sql);
		        preparedStatement.setString(1, names);
		        preparedStatement.setString(2, lastName);
		        preparedStatement.setString(3, typeDocument);
		        preparedStatement.setString(4, numberDocument);
		        resultSet = preparedStatement.executeQuery();
		        while (resultSet.next()) {
		            client item = mapRow(resultSet);
		            clientList.add(item);
		        }
		    } catch (SQLException e) {
		        // Manejo de la excepción
		        e.printStackTrace();
		        // Manejar la excepción de manera adecuada en tu aplicación
		    } finally {
		        // Cerrar los recursos
		        try {
		            if (resultSet != null) {
		                resultSet.close();
		            }
		            if (preparedStatement != null) {
		                preparedStatement.close();
		            }
		            if (connection != null) {
		                connection.close();
		            }
		        } catch (SQLException e) {
		            // Manejo de la excepción al cerrar los recursos
		            e.printStackTrace();
		            // Manejar la excepción de manera adecuada en tu aplicación
		        }
		    }
		    return clientList;
		}


		
		public void insert(client bean) {
			// Variables
			Connection cn = null;
			PreparedStatement pstm = null;
			Integer id = 0;
			// Proceso
			try {
				// Iniciar la Tx
				cn = ACCESODB.getConnection();
				cn.setAutoCommit(false);
				// Insertar nuevo empleado
				pstm = cn.prepareStatement(SQL_INSERT);
				pstm.setString(1, bean.getNames());
		        pstm.setString(2, bean.getLastname());
		        pstm.setString(3, bean.getCellphone());
		        pstm.setString(4, bean.getEmail());
		        pstm.setString(5, bean.getType_document());
		        pstm.setString(6, bean.getNumber_document());
		 
				pstm.executeUpdate();
				pstm.close();
				// Fin de Tx
				bean.setId(id);
				cn.commit();
			} catch (SQLException e) {
				try {
					cn.rollback();
					cn.close();
				} catch (Exception e2) {
				}
				throw new RuntimeException(e.getMessage());
			} finally {
				try {
					cn.close();
				} catch (Exception e2) {
				}
			}
		}
		
		public void update(client bean) {
		    // Variables
		    Connection cn = null;
		    PreparedStatement pstm = null;

		    // Proceso
		    try {
		        // Iniciar la Tx
		        cn = ACCESODB.getConnection();
		        cn.setAutoCommit(false);

		        // Actualizar el registro
		        pstm = cn.prepareStatement(SQL_UPDATE);
		        pstm.setString(1, bean.getNames());
		        pstm.setString(2, bean.getLastname());
		        pstm.setString(3, bean.getCellphone());
		        pstm.setString(4, bean.getEmail());
		        pstm.setString(5, bean.getType_document());
		        pstm.setString(6, bean.getNumber_document());
		    
		        pstm.setInt(7, bean.getId()); // Agregar el id para la cláusula WHERE
		        pstm.executeUpdate(); // Ejecutar la sentencia de actualización
		        pstm.close();

		        // Fin de Tx
		        cn.commit();
		    } catch (SQLException e) {
		        try {
		            cn.rollback();
		            cn.close();
		        } catch (Exception e2) {
		        }
		        throw new RuntimeException(e.getMessage());
		    } finally {
		        try {
		            cn.close();
		        } catch (Exception e2) {
		        }
		    }
		}
		
		
		public void updateStatus(String id) {
		    // Variables
		    Connection cn = null;
		    PreparedStatement pstm = null;
		    String sqlQuery;

		    // Proceso
		    try {
		        // Iniciar la Tx
		        cn = ACCESODB.getConnection();
		        cn.setAutoCommit(false);


		        // Verificar el estado actual del estudiante
		        sqlQuery = "SELECT status FROM student WHERE id = ?";

		        // Verificar el estado actual del Cliente
		        sqlQuery = "SELECT status FROM customer WHERE id = ?";
		        pstm = cn.prepareStatement(sqlQuery);
		        pstm.setString(1, id);
		        ResultSet rs = pstm.executeQuery();

		        if (rs.next()) {
		            String currentStatus = rs.getString("status");
		            String newStatus;

		            // Determinar el nuevo estado basado en el estado actual
		            if (currentStatus.equals("A")) {
		                newStatus = "I";
		            } else {
		                newStatus = "A";
		            }
	            // Actualizar el estado del estudiante
		            sqlQuery = "UPDATE student SET status = ? WHERE id = ?";

		            // Actualizar el estado del Cliente
		            sqlQuery = "UPDATE customer SET status = ? WHERE id = ?";
		            pstm = cn.prepareStatement(sqlQuery);
		            pstm.setString(1, newStatus);
		            pstm.setString(2, id);
		            pstm.executeUpdate();
		        }

		        rs.close();
		        pstm.close();

		        // Fin de Tx
		        cn.commit();
		    } catch (SQLException e) {
		        try {
		            cn.rollback();
		            cn.close();
		        } catch (Exception e2) {
		        }
		        throw new RuntimeException(e.getMessage());
		    } finally {
		        try {
		            cn.close();
		        } catch (Exception e2) {
		        }
		    }
		}
		
		public void delete(String id) {
		    // Variables
		    Connection cn = null;
		    PreparedStatement pstm = null;
		    // Proceso
		    try {
		        // Iniciar la Tx
		        cn = ACCESODB.getConnection();
		        cn.setAutoCommit(false);

		        // Actualizar el estado del estudiante a 'I' (inactivo)
		        pstm = cn.prepareStatement(SQL_DELETE);
		        pstm.setString(1, id);
		        pstm.executeUpdate();
		        pstm.close();

		        // Fin de Tx
		        cn.commit();
		    } catch (SQLException e) {
		        try {
		            cn.rollback();
		            cn.close();
		        } catch (Exception e2) {
		        }
		        throw new RuntimeException(e.getMessage());
		    } finally {
		        try {
		            cn.close();
		        } catch (Exception e2) {
		        }
		    }
		}
		
		
		public void active(String id) {
		    // Variables
		    Connection cn = null;
		    PreparedStatement pstm = null;
		    // Proceso
		    try {
		        // Iniciar la Tx
		        cn = ACCESODB.getConnection();
		        cn.setAutoCommit(false);

		        // Actualizar el estado del estudiante a 'A' (activo)
		        pstm = cn.prepareStatement(SQL_ACTIVE);
		        pstm.setString(1, id);
		        pstm.executeUpdate();
		        pstm.close();

		        // Fin de Tx
		        cn.commit();
		    } catch (SQLException e) {
		        try {
		            cn.rollback();
		            cn.close();
		        } catch (Exception e2) {
		        }
		        throw new RuntimeException(e.getMessage());
		    } finally {
		        try {
		            cn.close();
		        } catch (Exception e2) {
		        }
		    }
		}
		
		@Override
		public client mapRow(ResultSet rs) throws SQLException {
			client bean = new client();
			// Columnas: id, apellido, nombre, tipo de documento, email, numero de documento, celular, estado y id de grado
			bean.setId(rs.getInt("id"));
			bean.setNames(rs.getString("names"));
			bean.setLastname(rs.getString("lastname"));
			bean.setCellphone(rs.getString("cellphone"));
			bean.setEmail(rs.getString("email"));
			bean.setType_document(rs.getString("type_document"));
			bean.setNumber_document(rs.getString("number_document"));
			bean.setStatus(rs.getString("status"));
		
			return bean;
		}


}
