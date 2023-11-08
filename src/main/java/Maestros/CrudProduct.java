package Maestros;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import ACCESODB.ACCESODB;
import Modelos.product;
import service.spec.CrudServiceSpec;
import service.spec.RowMapper;

public class CrudProduct implements CrudServiceSpec<product>, RowMapper<product> {
    private final String SQL_SELECT_BASE = "SELECT code, description, points, name, type, brand, state, stock FROM product";
    private final String SQL_INSERT = "INSERT INTO product (code, description, points, name, type, brand, state, stock) VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
    private final String SQL_UPDATE = "UPDATE product SET code=?, description=?, points=?, name=?, type=?, brand=?, state=?, stock=? WHERE id = ?";
    private final String SQL_DELETE = "DELETE FROM product WHERE id = ?";

    @Override
    public List<product> getAll() {
        Connection cn = null;
        List<product> lista = new ArrayList<>();
        PreparedStatement pstm = null;
        ResultSet rs = null;
        product bean;
        try {
            cn = ACCESODB.getConnection();
            pstm = cn.prepareStatement(SQL_SELECT_BASE);
            rs = pstm.executeQuery();
            while (rs.next()) {
                bean = mapRow(rs);
                lista.add(bean);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pstm != null) {
                    pstm.close();
                }
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e2) {
            }
        }
        return lista;
    }

    @Override
    public product getForId(String id) {
        Connection cn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        product bean = null;
        String sql;
        try {
            cn = ACCESODB.getConnection();
            sql = SQL_SELECT_BASE + " WHERE id=?";
            pstm = cn.prepareStatement(sql);
            pstm.setInt(1, Integer.parseInt(id));
            rs = pstm.executeQuery();
            if (rs.next()) {
                bean = mapRow(rs);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pstm != null) {
                    pstm.close();
                }
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
        return bean;
    }

    @Override
    public List<product> get(product product) {
        Connection connection = null;
        List<product> productList = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        String sql;
        String code;
        String description;
        double points;
        String name;
        String type;
        String brand;
        String state;
        Integer stock;

        code = "%" + UtilService.setStringVacio(product.getCode()) + "%";
        description = "%" + UtilService.setStringVacio(product.getDescription()) + "%";
        points = product.getPoitns();
        name = "%" + UtilService.setStringVacio(product.getName()) + "%";
        type = "%" + UtilService.setStringVacio(product.getType()) + "%";
        brand = "%" + UtilService.setStringVacio(product.getBrand()) + "%";
        state = "%" + UtilService.setStringVacio(product.getState()) + "%";
        stock = product.getStock();

        try {
            connection = ACCESODB.getConnection();
            sql = SQL_SELECT_BASE + " WHERE code LIKE ? AND description LIKE ? AND points = ? AND name LIKE ? AND type LIKE ? AND brand LIKE ? AND state LIKE ? AND stock = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, code);
            preparedStatement.setString(2, description);
            preparedStatement.setDouble(3, points);
            preparedStatement.setString(4, name);
            preparedStatement.setString(5, type);
            preparedStatement.setString(6, brand);
            preparedStatement.setString(7, state);
            preparedStatement.setInt(8, stock);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                product item = mapRow(resultSet);
                productList.add(item);
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
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
        return productList;
    }

    @Override
    public void insert(product bean) {
        Connection cn = null;
        PreparedStatement pstm = null;
        try {
            cn = ACCESODB.getConnection();
            cn.setAutoCommit(false);
            pstm = cn.prepareStatement(SQL_INSERT);
            pstm.setString(1, bean.getCode());
            pstm.setString(2, bean.getDescription());
            pstm.setDouble(3, bean.getPoitns());
            pstm.setString(4, bean.getName());
            pstm.setString(5, bean.getType());
            pstm.setString(6, bean.getBrand());
            pstm.setString(7, bean.getState());
            pstm.setInt(8, bean.getStock());
            pstm.executeUpdate();
            pstm.close();
            cn.commit();
        } catch (SQLException e) {
            try {
                cn.rollback();
            } catch (Exception e2) {
            }
            throw new RuntimeException(e.getMessage());
        } finally {
            try {
                if (pstm != null) {
                    pstm.close();
                }
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e2) {
            }
        }
    }

    @Override
    public void update(product bean) {
        Connection cn = null;
        PreparedStatement pstm = null;
        try {
            cn = ACCESODB.getConnection();
            cn.setAutoCommit(false);
            pstm = cn.prepareStatement(SQL_UPDATE);
            pstm.setString(1, bean.getDescription());
            pstm.setDouble(2, bean.getPoitns());
            pstm.setString(3, bean.getName());
            pstm.setString(4, bean.getType());
            pstm.setString(5, bean.getBrand());
            pstm.setString(6,bean.getState());
            pstm.setInt(7, bean.getStock()); 
            pstm.setString(8, bean.getCode());
            pstm.executeUpdate();
            pstm.close();
            cn.commit();
        } catch (SQLException e) {
            try {
                cn.rollback();
            } catch (Exception e2) {
            }
            throw new RuntimeException(e.getMessage());
        } finally {
            try {
                if (pstm != null) {
                    pstm.close();
                }
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e2) {
            }
        }
    }

    @Override
    public void delete(String id) {
        Connection cn = null;
        PreparedStatement pstm = null;
        try {
            cn = ACCESODB.getConnection();
            cn.setAutoCommit(false);
            pstm = cn.prepareStatement(SQL_DELETE);
            pstm.setInt(1, Integer.parseInt(id));
            pstm.executeUpdate();
            pstm.close();
            cn.commit();
        } catch (SQLException e) {
            try {
                cn.rollback();
            } catch (Exception e2) {
            }
            throw new RuntimeException(e.getMessage());
        } finally {
            try {
                if (pstm != null) {
                    pstm.close();
                }
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e2) {
            }
        }
    }

    @Override
    public product mapRow(ResultSet rs) throws SQLException {
        product bean = new product();
        bean.setCode(rs.getString("code"));
        bean.setDescription(rs.getString("description"));
        bean.setPoints(rs.getDouble("points"));
        bean.setName(rs.getString("name"));
        bean.setType(rs.getString("type"));
        bean.setBrand(rs.getString("brand"));
        bean.setState(rs.getString("state"));
        bean.setStock(rs.getInt("stock"));
        bean.setState(rs.getString("state"));
        return bean;
    }

    @Override
    public void active(String id) {
        // Método no implementado en este código.
    }

    @Override
    public void updateStatus(String id) {
        // Método no implementado en este código.
    }
}
