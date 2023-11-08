package ACCESODB;

import java.sql.Connection;
/*Importacion de sql connection*/

public class ProbarConexion {
	
	public static void main(String[] args) {
		try {
			Connection cn = ACCESODB.getConnection();
			System.out.println("Conexión Exitosa con SQL SERVER 2019");
			cn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}

