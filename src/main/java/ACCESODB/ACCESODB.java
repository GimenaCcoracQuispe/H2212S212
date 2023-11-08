package ACCESODB;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ACCESODB {
	private ACCESODB() {
	}
		public static Connection getConnection() throws SQLException {
			Connection cn = null;
			String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	        String urlDB = "jdbc:sqlserver://localhost:1433;databaseName=db_puntos;encrypt=true;TrustServerCertificate=True;"; /*En database Name poner su nombre de la BD a escanear*/
			String user="sa"; /*Aca se pone la usuario de conexion a SQL Server*/
			String pass = "admin"; /*Aca se pone la contraseña de conexion a SQL Server*/
			try {
				// Paso 1: Cargar el driver a memoria
				Class.forName(driver).getDeclaredConstructor().newInstance();
				// Paso 2: Obtener el objeto Connection
				cn = DriverManager.getConnection(urlDB, user, pass);
			} catch (SQLException e) {
				throw e;
			} catch (ClassNotFoundException e) {
				throw new SQLException("No se encontró el driver de la base de datos.");
			} catch (Exception e) {
				throw new SQLException("No se puede establecer la conexión con la BD.");
			}
			return cn;
		}
		public static void main(String[] args) {
			try {
				Connection cn = ACCESODB.getConnection();
				System.out.println("Felicidades lograste conectar tu base de datos");
				cn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}


 