package Maestros;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import ACCESODB.ACCESODB;
import Modelos.seller;
import service.spec.CrudServiceSpec;
import service.spec.RowMapper;

public class CrudSeller implements CrudServiceSpec<seller>, RowMapper<seller> {
	// Definiendo cosas
	
			private final String SQL_SELECT_BASE = "SELECT id, names, lastname, email, cellphone, seller_user, password_user, document_type, number_document, status FROM SELLER";
			private final String SQL_INSERT = "INSERT INTO SELLER (names, lastname , email, cellphone, seller_user, password_user,document_type,number_document) VALUES(?,?,?,?,?,?,?,?)";
			private final String SQL_UPDATE = "UPDATE SELLER SET names=?, lastname=? ,email=?,cellphone=?,seller_user=?,password_user = ?, document_type =?, number_document =? WHERE id = ?";
			
			private final String SQL_DELETE = "UPDATE SELLER SET status = 'I' WHERE id = ?";
			private final String SQL_ACTIVE = "UPDATE SELLER SET status = 'A' WHERE id = ?";
	
			//Listara todo los activos
			
			public List<seller> getAll() {
			    // Variables
			    Connection cn = null;
			    List<seller> lista = new ArrayList<>();
			    PreparedStatement pstm = null;
			    ResultSet rs = null;	
			    seller bean;
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
			public seller getForId(String id) {
				// Variables
				Connection cn = null;
				PreparedStatement pstm = null;
				ResultSet rs = null;
				seller bean = null;
				String sql;
				// Proceso
				try {
					cn = ACCESODB.getConnection();
					sql = SQL_SELECT_BASE + " WHERE id = ?";
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
			//Filtrador
			
			
			public List<seller> get(seller seller) {
			    Connection connection = null;
			    List<seller> sellerList = new ArrayList<>();
			    PreparedStatement preparedStatement = null;
			    ResultSet resultSet = null;
			    String sql;
			    String names;
			    String lastname;
			    String document_type;
			    String numberDocument;
			    String seller_user;
			    String password_user;

			    names = "%" + UtilService.setStringVacio(seller.getNames()) + "%";
			    lastname = "%" + UtilService.setStringVacio(seller.getLastnames()) + "%";
			    document_type = "%" + UtilService.setStringVacio(seller.getDocument_type()) + "%";
			    numberDocument = "%" + UtilService.setStringVacio(seller.getNumber_document()) + "%";
			    seller_user = "%" + UtilService.setStringVacio(seller.getSeller_user()) + "%";
			    password_user = "%" + UtilService.setStringVacio(seller.getPassword_user()) + "%";

			    try {
			        connection = ACCESODB.getConnection();
			        sql = SQL_SELECT_BASE + " WHERE names LIKE ? AND lastname LIKE ? AND document_type LIKE ? AND number_document LIKE ? AND seller_user LIKE ? AND password_user LIKE ?";
			        preparedStatement = connection.prepareStatement(sql);
			        preparedStatement.setString(1, names);
			        preparedStatement.setString(2, lastname);
			        preparedStatement.setString(3, document_type);
			        preparedStatement.setString(4, numberDocument);
			        preparedStatement.setString(5, seller_user);
			        preparedStatement.setString(6, password_user);
			        resultSet = preparedStatement.executeQuery();

			        while (resultSet.next()) {
			            seller item = mapRow(resultSet);
			            sellerList.add(item);
			        }
			    } catch (SQLException e) {
			        throw new RuntimeException(e.getMessage());
			    } finally {
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
			            // Manejo de excepciones
			            e.printStackTrace();
			            // Manejar la excepción de manera adecuada en tu aplicación
			        }
			    }
			    return sellerList;
			}

			
			@Override
			public void insert(seller bean) {
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
			        pstm.setString(2, bean.getLastnames());
			        pstm.setString(3, bean.getEmail());
			        pstm.setString(4, bean.getCellphone());
			        pstm.setString(5, bean.getSeller_user());
			        pstm.setString(6, bean.getPassword_user());
			        pstm.setString(7, bean.getDocument_type());
			        pstm.setString(8, bean.getNumber_document());
			 
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
			
			public void update(seller bean) {
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
			        pstm.setString(2, bean.getLastnames());
			        pstm.setString(3, bean.getEmail());
			        pstm.setString(4, bean.getCellphone());
			        pstm.setString(5, bean.getSeller_user());
			        pstm.setString(6, bean.getPassword_user());
			        pstm.setString(7, bean.getDocument_type());
			        pstm.setString(8, bean.getNumber_document());
			    
			        pstm.setInt(9, bean.getId()); // Agregar el id para la cláusula WHERE
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

			        // Verificar el estado actual del vendedor
			        sqlQuery = "SELECT status FROM SELLER WHERE id = ?";
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

			            // Actualizar el estado del vendedor
			            sqlQuery = "UPDATE SELLER SET status = ? WHERE id = ?";
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

			        // Actualizar el estado del vendedor a 'I' (inactivo)
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

			        // Actualizar el estado del vendedor a 'A' (activo)
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
			public seller mapRow(ResultSet rs) throws SQLException {
				seller bean = new seller();
				// Columnas: id, apellido, nombre, tipo de documento, email, numero de documento, celular,
				bean.setId(rs.getInt("id"));
				bean.setNames(rs.getString("names"));
				bean.setLastnames(rs.getString("lastname"));
				bean.setEmail(rs.getString("email"));
				bean.setCellphone(rs.getString("cellphone"));
				bean.setSeller_user(rs.getString("seller_user"));
				bean.setPassword_user(rs.getString("password_user"));
				bean.setDocument_type(rs.getString("document_type"));
				bean.setNumber_document(rs.getString("number_document"));
				bean.setStatus(rs.getString("status"));
			
				return bean;
			}


}
