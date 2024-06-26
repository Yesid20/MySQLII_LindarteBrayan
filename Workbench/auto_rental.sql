-- ###############################
-- ## autorental - ###############
-- ###############################

-- Creación de la base de datos 
CREATE DATABASE auto_rental;

-- Uso de la bd 
USE auto_rental;

-- Creación de tabla 

CREATE TABLE sucursal (
	id INT PRIMARY KEY,
    id_sucursal_salida INT,
    id_sucursal_entrada INT,
    ciudad VARCHAR(30) NOT NULL,
    direccion VARCHAR(50) NOT NULL,
    telefono_fijo INT,
    celular BIGINT,
    email VARCHAR(40)
);

ALTER TABLE sucursal 
MODIFY COLUMN celular BIGINT;

CREATE TABLE usuario (
	id INT PRIMARY KEY,
    nombre_usuario VARCHAR(40),
    email VARCHAR(40),
    contraseña VARCHAR(30),
    rol ENUM ('empleado', 'cliente')
);

CREATE TABLE empleado (
	id INT PRIMARY KEY,
    id_usuario INT NOT NULL, 
    id_sucursal INT NOT NULL,
    cedula INT NOT NULL,
    nombres VARCHAR(40) NOT NULL,
    apellidos VARCHAR(45) NOT NULL,
    direccion VARCHAR(50) NOT NULL,
    ciudad_residencia VARCHAR(30),
    celular BIGINT NULL,
    email VARCHAR(40) NOT NULL,
    FOREIGN KEY(id_usuario) REFERENCES usuario(id),
    FOREIGN KEY(id_sucursal) REFERENCES sucursal(id)
);
ALTER TABLE empleado 
MODIFY COLUMN celular BIGINT;

CREATE TABLE cliente (
	id INT PRIMARY KEY,
    cedula INT NOT NULL,
    nombres VARCHAR(40) NOT NULL,
    apellidos VARCHAR(45) NOT NULL,
    direccion VARCHAR(50)NULL,
    ciudad_residencia VARCHAR(30) NOT NULL,
    celular INT NULL,
    email VARCHAR(40)
);

CREATE TABLE vehiculo (
	id INT PRIMARY KEY,
    tipo ENUM('sedan','compacto','camioneta_platon','camioneta_lujo', 'deportivo'),
    placa VARCHAR(30) NOT NULL,
    referencia VARCHAR(45) NOT NULL,
    modelo VARCHAR (50) NOT NULL,
    puertas INT NOT NULL,
    capacidad VARCHAR(20) NOT NULL,
    sunroof BOOLEAN, 
    motor VARCHAR(50) NOT NULL,
    color VARCHAR(30) NOT NULL
);

CREATE TABLE alquiler (
	id INT PRIMARY KEY,
    id_cliente INT,
    id_empleado INT,
    id_sucursal_salida INT NOT NULL,
    id_sucursal_entrada INT NOT NULL,
    sunroof BOOLEAN,
    fecha_salida DATE NOT NULL,
    fecha_llegada DATE NOT NULL,
    fecha_esperada_llegada DATE NOT NULL,
    valor_alquiler_semana INT,
    porcentaje_descuento INT,
    valor_cotizado INT,
    valor_pagado INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id),
    FOREIGN KEY (id_empleado) REFERENCES empleado(id),
    FOREIGN KEY (id_sucursal_salida) REFERENCES sucursal(id),
    FOREIGN KEY (id_sucursal_entrada) REFERENCES sucursal(id)
);

 CREATE TABLE sesion(
	id INT PRIMARY KEY,
    id_usuario INT,
    ultima_vez DATE,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id)
 );
 
 
 -- #################################
 
 -- Inserciones de las tablas 
 
 INSERT INTO sucursal (id, ciudad, direccion, telefono_fijo, celular, email) 
 VALUES (1, 'Bogota', 'Calle 123 #45-67', 1234567, 3201234567, 'bogota@autorental.com'),
 (2, 'Medellin', 'Carrera 67 #89-12', 2345678, 3102345678, 'medellin@autorental.com'),
(3, 'Cali', 'Avenida 4 Norte #12-34', 3456789, 3003456789, 'cali@autorental.com'),
(4, 'Barranquilla', 'Calle 45 #56-78', 4567890, 3504567890, 'barranquilla@autorental.com'),
(5, 'Cartagena', 'Carrera 23 #78-90', 5678901, 3205678901, 'cartagena@autorental.com');

SET SQL_SAFE_UPDATES = 0;

SET FOREIGN_KEY_CHECKS = 0;

DELETE FROM sucursal WHERE id NOT IN (SELECT id FROM tem_table);

SET FOREIGN_KEY_CHECKS = 1;


SELECT * FROM sucursal;

CREATE TEMPORARY TABLE tem_table as
SELECT * FROM sucursal
ORDER BY id
LIMIT 5;

DELETE FROM sucursal;

INSERT INTO sucursal
SELECT * FROM tem_table;

DROP TABLE tem_table;

SELECT * FROM tem_table;



INSERT INTO usuario (id, nombre_usuario, email, contraseña, rol) 
VALUES (1,'jdoe', 'jdoe@email.com', 'hashedpassword1', 'empleado'),
(2, 'cantino', 'jdoe2@email.com', 'hashedpassword2', 'cliente'),
(3, 'felipino', 'jdoe3@email.com', 'hashedpassword3', 'empleado'),
(4, 'enswer', 'jdoe4@email.com', 'hashedpassword4', 'cliente'),
(5, 'camilo', 'jdoe5@email.com', 'hashedpassword5', 'empleado'),
(6, 'andres', 'jdoe6@email.com', 'hashedpassword6', 'cliente'),
(7, 'deivid', 'jdoe7@email.com', 'hashedpassword7', 'empleado'),
(8, 'david', 'jdoe8@email.com', 'hashedpassword8', 'cliente'),
(9, 'faustino', 'jdoe9@email.com', 'hashedpassword9', 'empleado'),
(10, 'valderrama', 'jdoe10@email.com', 'hashedpassword10', 'cliente'),
(11, 'jorge', 'jdoe11@email.com', 'hashedpassword11', 'empleado'),
(12, 'luis', 'jdoe12@email.com', 'hashedpassword12', 'cliente'),
(13, 'edinson', 'jdoe13@email.com', 'hashedpassword13', 'empleado'),
(14, 'javier', 'jdoe14@email.com', 'hashedpassword14', 'cliente'),
(15, 'alfonso', 'jdoe15@email.com', 'hashedpassword15', 'empleado'),
(16, 'palestino', 'jdoe16@email.com', 'hashedpassword16', 'cliente'),
(17, 'andorria', 'jdoe17@email.com', 'hashedpassword17', 'empleado'),
(18, 'leonel', 'jdoe18@email.com', 'hashedpassword18', 'cliente'),
(19, 'danielito', 'jdoe19@email.com', 'hashedpassword19', 'empleado'),
(20, 'latorre', 'jdoe20@email.com', 'hashedpassword20', 'cliente'),
(21, 'costenin', 'jdoe21@email.com', 'hashedpassword21', 'empleado'),
(22, 'jair', 'jdoe22@email.com', 'hashedpassword22', 'cliente'),
(23, 'paulo', 'jdoe23@email.com', 'hashedpassword23', 'empleado'),
(24, 'hellen', 'jdoe24@email.com', 'hashedpassword24', 'cliente'),
(25, 'daniela', 'jdoe25@email.com', 'hashedpassword25', 'empleado'),
(26, 'catalina', 'jdoe26@email.com', 'hashedpassword26', 'cliente'),
(27, 'kenia', 'jdoe27@email.com', 'hashedpassword27', 'empleado'),
(28, 'pedro', 'jdoe28@email.com', 'hashedpassword28', 'cliente'),
(29, 'arnulfo', 'jdoe29@email.com', 'hashedpassword29', 'empleado'),
(30, 'malavera', 'jdoe30@email.com', 'hashedpassword30', 'cliente'),
(31, 'juano', 'jdoe31@email.com', 'hashedpassword31', 'empleado'),
(32, 'james', 'jdoe32@email.com', 'hashedpassword32', 'cliente'),
(33, 'antonio', 'jdoe33@email.com', 'hashedpassword33', 'empleado'),
(34, 'yerri', 'jdoe34@email.com', 'hashedpassword34', 'cliente'),
(35, 'ruben', 'jdoe35@email.com', 'hashedpassword35', 'empleado'),
(36, 'lorenzo', 'jdoe36@email.com', 'hashedpassword36', 'cliente'),
(37, 'industriales', 'jdoe37@email.com', 'hashedpassword37', 'empleado'),
(38, 'santiago', 'jdoe38@email.com', 'hashedpassword38', 'cliente'),
(39, 'cuesta', 'jdoe39@email.com', 'hashedpassword39', 'empleado'),
(40, 'alzate', 'jdoe40@email.com', 'hashedpassword40', 'cliente'),
(41, 'guillermo', 'jdoe41@email.com', 'hashedpassword41', 'empleado'),
(42, 'cuadrado', 'jdoe42@email.com', 'hashedpassword42', 'cliente'),
(43, 'freddy', 'jdoe43@email.com', 'hashedpassword43', 'empleado'),
(44, 'montero', 'jdoe44@email.com', 'hashedpassword44', 'cliente'),
(45, 'vargas', 'jdoe45@email.com', 'hashedpassword45', 'empleado'),
(46, 'falcao', 'jdoe46@email.com', 'hashedpassword46', 'cliente'),
(47, 'asprilla', 'jdoe47@email.com', 'hashedpassword47', 'empleado'),
(48, 'perea', 'jdoe48@email.com', 'hashedpassword48', 'cliente'),
(49, 'velez', 'jdoe49@email.com', 'hashedpassword49', 'empleado'),
(50, 'hilda', 'jdoe50@email.com', 'hashedpassword50', 'cliente'),
(51, 'alice', 'alice@email.com', 'hashedpassword51', 'empleado'),
(52, 'bob', 'bob@email.com', 'hashedpassword52', 'cliente'),
(53, 'carol', 'carol@email.com', 'hashedpassword53', 'empleado'),
(54, 'davidd', 'david@email.com', 'hashedpassword54', 'cliente'),
(55, 'emma', 'emma@email.com', 'hashedpassword55', 'empleado'),
(56, 'fred', 'fred@email.com', 'hashedpassword56', 'cliente'),
(57, 'grace', 'grace@email.com', 'hashedpassword57', 'empleado'),
(58, 'henry', 'henry@email.com', 'hashedpassword58', 'cliente'),
(59, 'isabel', 'isabel@email.com', 'hashedpassword59', 'empleado'),
(60, 'jack', 'jack@email.com', 'hashedpassword60', 'cliente'),
(61, 'kate', 'kate@email.com', 'hashedpassword61', 'empleado'),
(62, 'leon', 'leon@email.com', 'hashedpassword62', 'cliente'),
(63, 'megan', 'megan@email.com', 'hashedpassword63', 'empleado'),
(64, 'nathan', 'nathan@email.com', 'hashedpassword64', 'cliente'),
(65, 'olivia', 'olivia@email.com', 'hashedpassword65', 'empleado'),
(66, 'peter', 'peter@email.com', 'hashedpassword66', 'cliente'),
(67, 'quinn', 'quinn@email.com', 'hashedpassword67', 'empleado'),
(68, 'ryan', 'ryan@email.com', 'hashedpassword68', 'cliente'),
(69, 'sophia', 'sophia@email.com', 'hashedpassword69', 'empleado'),
(70, 'thomas', 'thomas@email.com', 'hashedpassword70', 'cliente'),
(71, 'ursula', 'ursula@email.com', 'hashedpassword71', 'empleado'),
(72, 'victor', 'victor@email.com', 'hashedpassword72', 'cliente'),
(73, 'wendy', 'wendy@email.com', 'hashedpassword73', 'empleado'),
(74, 'xavier', 'xavier@email.com', 'hashedpassword74', 'cliente'),
(75, 'yvonne', 'yvonne@email.com', 'hashedpassword75', 'empleado'),
(76, 'zachary', 'zachary@email.com', 'hashedpassword76', 'cliente'),
(77, 'alicia', 'alicia@email.com', 'hashedpassword77', 'empleado'),
(78, 'brandon', 'brandon@email.com', 'hashedpassword78', 'cliente'),
(79, 'cynthia', 'cynthia@email.com', 'hashedpassword79', 'empleado'),
(80, 'danyel', 'daniel@email.com', 'hashedpassword80', 'cliente'),
(81, 'elena', 'elena@email.com', 'hashedpassword81', 'empleado'),
(82, 'felix', 'felix@email.com', 'hashedpassword82', 'cliente'),
(83, 'gina', 'gina@email.com', 'hashedpassword83', 'empleado'),
(84, 'hugo', 'hugo@email.com', 'hashedpassword84', 'cliente'),
(85, 'irene', 'irene@email.com', 'hashedpassword85', 'empleado'),
(86, 'jason', 'jason@email.com', 'hashedpassword86', 'cliente'),
(87, 'kim', 'kim@email.com', 'hashedpassword87', 'empleado'),
(88, 'lucas', 'lucas@email.com', 'hashedpassword88', 'cliente'),
(89, 'maya', 'maya@email.com', 'hashedpassword89', 'empleado'),
(90, 'nicholas', 'nicholas@email.com', 'hashedpassword90', 'cliente'),
(91, 'oliver', 'oliver@email.com', 'hashedpassword91', 'empleado'),
(92, 'penelope', 'penelope@email.com', 'hashedpassword92', 'cliente'),
(93, 'quincy', 'quincy@email.com', 'hashedpassword93', 'empleado'),
(94, 'rachel', 'rachel@email.com', 'hashedpassword94', 'cliente'),
(95, 'sebastian', 'sebastian@email.com', 'hashedpassword95', 'empleado'),
(96, 'tara', 'tara@email.com', 'hashedpassword96', 'cliente'),
(97, 'ulysses', 'ulysses@email.com', 'hashedpassword97', 'empleado'),
(98, 'violet', 'violet@email.com', 'hashedpassword98', 'cliente'),
(99, 'winston', 'winston@email.com', 'hashedpassword99', 'empleado'),
(100, 'xena', 'xena@email.com', 'hashedpassword100', 'cliente');

INSERT INTO empleado (id, id_usuario, id_sucursal, cedula, nombres, apellidos, direccion, ciudad_residencia, celular, email)
VALUES (1,1,1, 123456789,'Diosano', 'valverde rojas', 'Carrera 45 #67-89', 'bogota', 3145879652, 'diose@email.com'),
		(2, 2, 2, 987654321, 'María', 'Gómez Pérez', 'Calle 34 #56-78', 'Bogotá', 3004567890, 'maria@email.com'),
(3, 3, 3, 567891234, 'Juan', 'Ramírez López', 'Avenida 7 #12-34', 'Bogotá', 3212345678, 'juan@email.com'),
(4, 4, 4, 345678912, 'Ana', 'Martínez Herrera', 'Carrera 89 #23-45', 'Bogotá', 3109876543, 'ana@email.com'),
(5, 5, 5, 789123456, 'Pedro', 'García Sánchez', 'Diagonal 56 #78-90', 'Bogotá', 3156789012, 'pedro@email.com'),
(6, 6, 1, 234567891, 'Laura', 'Castro Gutiérrez', 'Transversal 12 #34-56', 'Bogotá', 3187654321, 'laura@email.com'),
(7, 7, 2, 912345678, 'Carlos', 'Pérez Díaz', 'Carrera 67 #89-12', 'Bogotá', 3176543210, 'carlos@email.com'),
(8, 8, 3, 456789123, 'Sofía', 'López Martínez', 'Avenida 23 #45-67', 'Bogotá', 3198765432, 'sofia@email.com'),
(9, 9, 4, 678912345, 'Luis', 'Hernández Castro', 'Calle 78 #90-12', 'Bogotá', 3134567890, 'luis@email.com'),
(10, 10, 5, 891234567, 'Ana María', 'Ramírez Gómez', 'Carrera 56 #78-90', 'Bogotá', 3123456789, 'anamaria@email.com'),
(11, 11, 1, 321654987, 'David', 'Montoya García', 'Calle 56 #78-90', 'Medellín', 3145678901, 'david@email.com'),
(12, 12, 2, 654987321, 'Valentina', 'Gómez Ramírez', 'Avenida 34 #56-78', 'Medellín', 3101234567, 'valentina@email.com'),
(13, 13, 3, 987321654, 'Jorge', 'Martínez López', 'Transversal 23 #45-67', 'Medellín', 3178901234, 'jorge@email.com'),
(14, 14, 4, 123789456, 'Camila', 'Hernández Pérez', 'Diagonal 78 #90-12', 'Medellín', 3190123456, 'camila@email.com'),
(15, 15, 5, 456321789, 'Miguel', 'García Sánchez', 'Carrera 12 #34-56', 'Medellín', 3167890123, 'miguel@email.com'),
(16, 16, 1, 789654123, 'Daniela', 'Ramírez Gutiérrez', 'Calle 90 #12-34', 'Medellín', 3156789012, 'daniela@email.com'),
(17, 17, 2, 234567890, 'Andrés', 'López Castro', 'Avenida 45 #67-89', 'Medellín', 3134567890, 'andres@email.com'),
(18, 18, 3, 567890123, 'Paula', 'Martínez Díaz', 'Carrera 67 #89-12', 'Medellín', 3123456789, 'paula@email.com'),
(19, 19, 4, 890123456, 'Diego', 'Hernández Ramírez', 'Calle 34 #56-78', 'Medellín', 3042345678, 'diego@email.com'),
(20, 20, 5, 123466789, 'María José', 'Gómez Martínez', 'Transversal 56 #78-90', 'Medellín', 3189012345, 'mariajose@email.com'),
(21, 21, 1, 789456123, 'Sebastián', 'Herrera Ramírez', 'Carrera 23 #45-67', 'Cali', 3178901234, 'sebastian@email.com'),
(22, 22, 2, 456123789, 'Valeria', 'Gutiérrez Díaz', 'Avenida 56 #78-90', 'Cali', 3190123456, 'valeria@email.com'),
(23, 23, 3, 123789456, 'Felipe', 'Pérez Gómez', 'Diagonal 12 #34-56', 'Cali', 3167890123, 'felipe@email.com'),
(24, 24, 4, 890654321, 'Ana Sofía', 'Ramírez López', 'Calle 78 #90-12', 'Cali', 3156789012, 'anasofia@email.com'),
(25, 25, 5, 321234567, 'Martín', 'García Martínez', 'Carrera 34 #56-78', 'Cali', 3134567890, 'martin@email.com'),
(26, 26, 1, 654321789, 'Juliana', 'López Hernández', 'Transversal 67 #89-12', 'Cali', 3123456789, 'juliana@email.com'),
(27, 27, 2, 987654321, 'Andrea', 'Martínez Ramírez', 'Avenida 90 #12-34', 'Cali', 3102345678, 'andrea@email.com'),
(28, 28, 3, 234567890, 'Juan Pablo', 'Hernández Gómez', 'Calle 45 #67-89', 'Cali', 3189012345, 'juanpablo@email.com'),
(29, 29, 4, 567890123, 'Sara', 'Ramírez Pérez', 'Carrera 67 #89-12', 'Cali', 3145678901, 'sara@email.com'),
(30, 30, 5, 890123456, 'Daniel', 'Gómez Ramírez', 'Transversal 23 #45-67', 'Cali', 3112345678, 'daniel@email.com'),
(31, 31, 1, 321789456, 'Valentín', 'Herrera Gómez', 'Avenida 56 #78-90', 'Barranquilla', 3167890123, 'valentin@email.com'),
(32, 32, 2, 987456321, 'Carolina', 'Gómez López', 'Calle 34 #56-78', 'Barranquilla', 3156789012, 'carolina@email.com'),
(33, 33, 3, 654321789, 'Mateo', 'Ramírez Díaz', 'Diagonal 56 #78-90', 'Barranquilla', 3134567890, 'mateo@email.com'),
(34, 34, 4, 123890456, 'Camilo', 'Pérez Martínez', 'Carrera 12 #34-56', 'Barranquilla', 3123456789, 'camilo@email.com'),
(35, 35, 5, 456789012, 'Lucía', 'Martínez Gómez', 'Transversal 67 #89-12', 'Barranquilla', 3102345678, 'lucia@email.com'),
(36, 36, 1, 789012345, 'Simón', 'López Ramírez', 'Avenida 90 #12-34', 'Barranquilla', 3189012345, 'simon@email.com'),
(37, 37, 2, 234567890, 'Valentina', 'Gómez Pérez', 'Calle 45 #67-89', 'Barranquilla', 3145678901, 'valentina@email.com'),
(38, 38, 3, 567890123, 'Felipe', 'Ramírez Gómez', 'Carrera 23 #45-67', 'Barranquilla', 3112345678, 'felipe@email.com'),
(39, 39, 4, 890123456, 'Daniela', 'Herrera López', 'Diagonal 34 #56-78', 'Barranquilla', 3178901234, 'daniela@email.com'),
(40, 40, 5, 123456789, 'Santiago', 'Gómez Ramírez', 'Calle 78 #90-12', 'Barranquilla', 3190123456, 'santiago@email.com'),
(41, 41, 1, 987654321, 'Manuel', 'Martínez Pérez', 'Carrera 23 #45-67', 'Cartagena', 3134567890, 'manuel@email.com'),
(42, 42, 2, 654321987, 'Valeria', 'Gómez Ramírez', 'Calle 56 #78-90', 'Cartagena', 3123456789, 'valeria@email.com'),
(43, 43, 3, 321987654, 'Joaquín', 'Hernández Gómez', 'Diagonal 45 #67-89', 'Cartagena', 3102345678, 'joaquin@email.com'),
(44, 44, 4, 789012345, 'Camila', 'Ramírez López', 'Avenida 12 #34-56', 'Cartagena', 3189012345, 'camila@email.com'),
(45, 45, 5, 456789012, 'Mateo', 'Gómez Pérez', 'Transversal 78 #90-12', 'Cartagena', 3145678901, 'mateo@email.com'),
(46, 46, 1, 123456789, 'Luciana', 'Herrera Ramírez', 'Carrera 67 #89-12', 'Cartagena', 3178901234, 'luciana@email.com'),
(47, 47, 2, 890123456, 'Santiago', 'Ramírez Gómez', 'Calle 34 #56-78', 'Cartagena', 3190123456, 'santiago@email.com'),
(48, 48, 3, 234567890, 'Valentina', 'López Martínez', 'Diagonal 56 #78-90', 'Cartagena', 3156789012, 'valentina@email.com'),
(49, 49, 4, 567890123, 'Daniel', 'Martínez Ramírez', 'Avenida 67 #89-12', 'Cartagena', 3112345678, 'daniel@email.com'),
(50, 50, 5, 901234567, 'Isabella', 'Gómez López', 'Transversal 23 #45-67', 'Cartagena', 3167890123, 'isabella@email.com'),
(51, 51, 1, 987654321, 'Camilo', 'García Pérez', 'Calle 34 #56-78', 'Bogotá', 3101234567, 'camilo@email.com'),
(52, 52, 2, 234567890, 'Valentina', 'Ramírez Gómez', 'Diagonal 56 #78-90', 'Bogotá', 3189012345, 'valentina@email.com'),
(53, 53, 3, 876543210, 'Sara', 'López Martínez', 'Avenida 12 #34-56', 'Bogotá', 3167890123, 'sara@email.com'),
(54, 54, 4, 543210987, 'Javier', 'Martínez Ramírez', 'Transversal 67 #89-12', 'Bogotá', 3145678901, 'javier@email.com'),
(55, 55, 5, 210987654, 'Carolina', 'Gómez Pérez', 'Calle 45 #67-89', 'Bogotá', 3112345678, 'carolina@email.com'),
(56, 56, 1, 789012345, 'Mateo', 'Ramírez López', 'Carrera 23 #45-67', 'Bogotá', 3190123456, 'mateo@email.com'),
(57, 57, 2, 456789012, 'Lucía', 'Pérez Gómez', 'Diagonal 45 #67-89', 'Bogotá', 3156789012, 'lucia@email.com'),
(58, 58, 3, 123456789, 'Sebastián', 'García Ramírez', 'Avenida 56 #78-90', 'Bogotá', 3178901234, 'sebastian@email.com'),
(59, 59, 4, 890123456, 'Valeria', 'López Gómez', 'Transversal 78 #90-12', 'Bogotá', 3134567890, 'valeria@email.com'),
(60, 60, 5, 567890123, 'Daniel', 'Martínez Pérez', 'Calle 78 #90-12', 'Bogotá', 3123456789, 'daniel@email.com'),
(61, 61, 1, 456789012, 'María José', 'Ramírez Gómez', 'Carrera 12 #34-56', 'Medellín', 3145678901, 'mariajose@email.com'),
(62, 62, 2, 123456789, 'Juan', 'García Pérez', 'Calle 56 #78-90', 'Medellín', 3101234567, 'juan@email.com'),
(63, 63, 3, 890123456, 'Valentina', 'López Ramírez', 'Avenida 34 #56-78', 'Medellín', 3190123456, 'valentina@email.com'),
(64, 64, 4, 567890123, 'Andrés', 'Martínez Gómez', 'Transversal 67 #89-12', 'Medellín', 3178901234, 'andres@email.com'),
(65, 65, 5, 234567890, 'Camila', 'Gómez López', 'Diagonal 78 #90-12', 'Medellín', 3156789012, 'camila@email.com'),
(66, 66, 1, 901234567, 'Santiago', 'Ramírez Martínez', 'Calle 90 #12-34', 'Medellín', 3189012345, 'santiago@email.com'),
(67, 67, 2, 678901234, 'Daniela', 'López Herrera', 'Avenida 23 #45-67', 'Medellín', 3134567890, 'daniela@email.com'),
(68, 68, 3, 345678901, 'Miguel', 'Martínez Ramírez', 'Carrera 56 #78-90', 'Medellín', 3123456789, 'miguel@email.com'),
(69, 69, 4, 789012345, 'Valeria', 'Gómez Pérez', 'Transversal 12 #34-56', 'Medellín', 3112345678, 'valeria@email.com'),
(70, 70, 5, 456789012, 'Diego', 'Ramírez Gómez', 'Calle 34 #56-78', 'Medellín', 3167890123, 'diego@email.com'),
(71, 71, 1, 987654321, 'Julián', 'Ramírez López', 'Diagonal 34 #56-78', 'Cali', 3102345678, 'julian@email.com'),
(72, 72, 2, 654321987, 'Valentina', 'Gómez Ramírez', 'Carrera 45 #67-89', 'Cali', 3123456789, 'valentina@email.com'),
(73, 73, 3, 321987654, 'Felipe', 'Herrera Gómez', 'Calle 78 #90-12', 'Cali', 3145678901, 'felipe@email.com'),
(74, 74, 4, 789012345, 'Daniela', 'Pérez Ramírez', 'Transversal 23 #45-67', 'Cali', 3167890123, 'daniela@email.com'),
(75, 75, 5, 456789012, 'Santiago', 'Gómez López', 'Avenida 56 #78-90', 'Cali', 3189012345, 'santiago@email.com'),
(76, 76, 1, 123456789, 'Valeria', 'Ramírez Martínez', 'Calle 67 #89-12', 'Cali', 3112345678, 'valeria@email.com'),
(77, 77, 2, 890123456, 'Mateo', 'López Gómez', 'Diagonal 12 #34-56', 'Cali', 3190123456, 'mateo@email.com'),
(78, 78, 3, 567890123, 'Camila', 'Martínez Pérez', 'Transversal 56 #78-90', 'Cali', 3156789012, 'camila@email.com'),
(79, 79, 4, 234567890, 'Andrés', 'Ramírez López', 'Carrera 67 #89-12', 'Cali', 3134567890, 'andres@email.com'),
(80, 80, 5, 901234567, 'María José', 'Gómez Ramírez', 'Avenida 90 #12-34', 'Cali', 3178901234, 'mariajose@email.com'),
(81, 81, 1, 890123456, 'Valeria', 'López Ramírez', 'Calle 23 #45-67', 'Barranquilla', 3102345678, 'valeria@email.com'),
(82, 82, 2, 567890123, 'Andrés', 'Martínez Gómez', 'Diagonal 56 #78-90', 'Barranquilla', 3167890123, 'andres@email.com'),
(83, 83, 3, 234567890, 'Camila', 'Gómez Pérez', 'Carrera 12 #34-56', 'Barranquilla', 3145678901, 'camila@email.com'),
(84, 84, 4, 901234567, 'Santiago', 'Ramírez López', 'Transversal 45 #67-89', 'Barranquilla', 3123456789, 'santiago@email.com'),
(85, 85, 5, 678901234, 'Daniela', 'López Martínez', 'Avenida 67 #89-12', 'Barranquilla', 3190123456, 'daniela@email.com'),
(86, 86, 1, 345678901, 'Miguel', 'Martínez Ramírez', 'Calle 34 #56-78', 'Barranquilla', 3112345678, 'miguel@email.com'),
(87, 87, 2, 789012345, 'Valentina', 'Gómez López', 'Diagonal 78 #90-12', 'Barranquilla', 3178901234, 'valentina@email.com'),
(88, 88, 3, 456789012, 'Diego', 'Ramírez Gómez', 'Carrera 23 #45-67', 'Barranquilla', 3156789012, 'diego@email.com'),
(89, 89, 4, 123456789, 'Lucía', 'Pérez Martínez', 'Transversal 56 #78-90', 'Barranquilla', 3189012345, 'lucia@email.com'),
(90, 90, 5, 789012345, 'Carlos', 'García Ramírez', 'Avenida 34 #56-78', 'Barranquilla', 3134567890, 'carlos@email.com'),
(91, 91, 1, 678901234, 'Manuel', 'Ramírez Gómez', 'Carrera 56 #78-90', 'Cartagena', 3167890123, 'manuel@email.com'),
(92, 92, 2, 345678901, 'Valentina', 'López Pérez', 'Calle 78 #90-12', 'Cartagena', 3145678901, 'valentina@email.com'),
(93, 93, 3, 901234567, 'Javier', 'Martínez López', 'Diagonal 12 #34-56', 'Cartagena', 3123456789, 'javier@email.com'),
(94, 94, 4, 567890123, 'Camila', 'Gómez Ramírez', 'Transversal 67 #89-12', 'Cartagena', 3102345678, 'camila@email.com'),
(95, 96, 5, 234567890, 'Mateo', 'Ramírez Gómez', 'Avenida 45 #67-89', 'Cartagena', 3189012345, 'mateo@email.com'),
(96, 96, 1, 789012345, 'Valeria', 'López Martínez', 'Calle 34 #56-78', 'Cartagena', 3156789012, 'valeria@email.com'),
(97, 97, 2, 456789012, 'Santiago', 'Ramírez López', 'Diagonal 23 #45-67', 'Cartagena', 3190123456, 'santiago@email.com'),
(98, 98, 3, 123456789, 'Daniela', 'Gómez Ramírez', 'Carrera 67 #89-12', 'Cartagena', 3134567890, 'daniela@email.com'),
(99, 99, 4, 890123456, 'Andrés', 'Martínez López', 'Transversal 56 #78-90', 'Cartagena', 3112345678, 'andres@email.com'),
(100, 100, 5, 567890123, 'María José', 'Ramírez Gómez', 'Avenida 90 #12-34', 'Cartagena', 3178901234, 'mariajose@email.com');

SET FOREIGN_KEY_CHECKS = 1;

TRUNCATE TABLE empleado;

SELECT * FROM empleado;






-- ## DESARROLLADO POR BRAYAN YESID LINDARTE ANAYA - D.I. 1010120365

