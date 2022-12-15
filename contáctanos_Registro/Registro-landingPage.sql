/* Crear base de datos dbContáctanos */
CREATE DATABASE dbContáctanos;

/* Poner en uso la base de datos */
USE dbContáctanos;

/* Crear tabla Pedido */
CREATE TABLE CLIENTE
(
     IDCLI int AUTO_INCREMENT,
     USERCLI varchar(80),
     EMAUSCLI varchar(80),
     CELUSCLI char(9),
     DATUSCLI varchar(200),
     MSGCLI   varchar(500),
     PRIMARY KEY (IDCLI)
);

/* Insertar registros */
INSERT INTO CLIENTE
(USERCLI, EMAUSCLI, CELUSCLI, DATUSCLI, MSGCLI)
VALUES
('José Ramírez', 'jose.ramirez@outlook.com', '974815236', 'costo matrícula', 'Por favor quisiera saber cuanto es el costo de la matrícula '),
('Ana Guerra Solano', 'ana.guerra@gmail.com', '981526321', 'cuantos vacantes', 'Una consulta, cunatos vacantes tiene la I.E.P. José Buenaventura Sepúlveda.');

/* Listar los registros de la tabla CLIENTE */
SELECT * FROM CLIENTE;