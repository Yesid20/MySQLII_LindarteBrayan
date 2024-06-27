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

--  Insercion de los datos 

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


INSERT INTO cliente (id, cedula,nombres,apellidos,direccion,ciudad_residencia, celular, email) 
VALUES (1, '123456789', 'Juan', 'Pérez Gómez', 'Avenida 90 #12-34', 'Bogotá', '+5712345678', 'juan.perez@example.com'),
(2, '987654321', 'María', 'González López', 'Carrera 45 Transversal 67-89', 'Medellín', '+5745678901', 'maria.gonzalez@example.com'),
(3, '456789123', 'Pedro', 'Sánchez Rodríguez', 'Diagonal 23A Bis #56-78', 'Barranquilla', '+5756789012', 'pedro.sanchez@example.com'),
(4, '789123456', 'Ana', 'Martínez García', 'Calle 34 #45-67', 'Cali', '+5767890123', 'ana.martinez@example.com'),
(5, '234567891', 'Luis', 'Fernández López', 'Avenida 12 Este #34-56', 'Cartagena', '+5778901234', 'luis.fernandez@example.com'),
(6, '567891234', 'Laura', 'Gómez Ramírez', 'Transversal 78 #90-12', 'Bogotá', '+5712345678', 'laura.gomez@example.com'),
(7, '891234567', 'Carlos', 'Hernández Pérez', 'Diagonal 56 #78-90', 'Medellín', '+5745678901', 'carlos.hernandez@example.com'),
(8, '345678912', 'Sofía', 'Díaz Martínez', 'Calle 90 #12-34', 'Barranquilla', '+5756789012', 'sofia.diaz@example.com'),
(9, '678912345', 'Javier', 'López González', 'Avenida 67 #89-01', 'Cali', '+5767890123', 'javier.lopez@example.com'),
(10, '912345678', 'Andrea', 'Ramírez Sánchez', 'Transversal 34 #56-78', 'Cartagena', '+5778901234', 'andrea.ramirez@example.com'),
(11, '543216789', 'Diego', 'García Martínez', 'Diagonal 45 #67-89', 'Bogotá', '+5712345678', 'diego.garcia@example.com'),
(12, '876543219', 'Camila', 'Pérez Gómez', 'Calle 23 #45-67', 'Medellín', '+5745678901', 'camila.perez@example.com'),
(13, '321987654', 'Mateo', 'López Fernández', 'Avenida 56 #78-90', 'Barranquilla', '+5756789012', 'mateo.lopez@example.com'),
(14, '654321987', 'Valentina', 'Martínez Díaz', 'Transversal 12 #34-56', 'Cali', '+5767890123', 'valentina.martinez@example.com'),
(15, '987654321', 'Lucas', 'Ramírez López', 'Diagonal 78 #90-12', 'Cartagena', '+5778901234', 'lucas.ramirez@example.com'),
(16, '234567890', 'Isabella', 'Gómez Hernández', 'Calle 90 #12-34', 'Bogotá', '+5712345678', 'isabella.gomez@example.com'),
(17, '567890123', 'Matías', 'Hernández Díaz', 'Avenida 67 #89-01', 'Medellín', '+5745678901', 'matias.hernandez@example.com'),
(18, '890123456', 'Martina', 'Díaz López', 'Transversal 34 #56-78', 'Barranquilla', '+5756789012', 'martina.diaz@example.com'),
(19, '456789012', 'Thiago', 'López Ramírez', 'Diagonal 45 #67-89', 'Cali', '+5767890123', 'thiago.lopez@example.com'),
(20, '789012345', 'Mariana', 'García Martínez', 'Calle 23 #45-67', 'Cartagena', '+5778901234', 'mariana.garcia@example.com'),
(21, '345678901', 'Gabriel', 'Pérez Gómez', 'Avenida 56 #78-90', 'Bogotá', '+5712345678', 'gabriel.perez@example.com'),
(22, '678901234', 'Valeria', 'Gómez Díaz', 'Transversal 12 #34-56', 'Medellín', '+5745678901', 'valeria.gomez@example.com'),
(23, '901234567', 'Agustín', 'Ramírez López', 'Diagonal 78 #90-12', 'Barranquilla', '+5756789012', 'agustin.ramirez@example.com'),
(24, '123456780', 'Juana', 'Hernández Martínez', 'Calle 90 #12-34', 'Cali', '+5767890123', 'juana.hernandez@example.com'),
(25, '234567801', 'Maximiliano', 'Díaz Gómez', 'Avenida 67 #89-01', 'Cartagena', '+5778901234', 'maximiliano.diaz@example.com'),
(26, '345678912', 'Elena', 'López Ramírez', 'Transversal 34 #56-78', 'Bogotá', '+5712345678', 'elena.lopez@example.com'),
(27, '456789123', 'Benjamín', 'García Martínez', 'Diagonal 45 #67-89', 'Medellín', '+5745678901', 'benjamin.garcia@example.com'),
(28, '567891234', 'Emma', 'Pérez Gómez', 'Calle 23 #45-67', 'Barranquilla', '+5756789012', 'emma.perez@example.com'),
(29, '678912345', 'Facundo', 'Gómez Díaz', 'Avenida 56 #78-90', 'Cali', '+5767890123', 'facundo.gomez@example.com'),
(30, '789123456', 'Renata', 'Ramírez López', 'Transversal 12 #34-56', 'Cartagena', '+5778901234', 'renata.ramirez@example.com'),
(31, '891234567', 'Joaquín', 'Hernández Martínez', 'Diagonal 78 #90-12', 'Bogotá', '+5712345678', 'joaquin.hernandez@example.com'),
(32, '912345678', 'Antonella', 'Díaz Gómez', 'Calle 90 #12-34', 'Medellín', '+5745678901', 'antonella.diaz@example.com'),
(33, '123456789', 'Franco', 'López Ramírez', 'Avenida 67 #89-01', 'Barranquilla', '+5756789012', 'franco.lopez@example.com'),
(34, '234567890', 'Catalina', 'García Martínez', 'Transversal 34 #56-78', 'Cali', '+5767890123', 'catalina.garcia@example.com'),
(35, '345678901', 'Bautista', 'Pérez Gómez', 'Diagonal 45 #67-89', 'Cartagena', '+5778901234', 'bautista.perez@example.com'),
(36, '456789012', 'Martina', 'Gómez Díaz', 'Calle 23 #45-67', 'Bogotá', '+5712345678', 'martina.gomez@example.com'),
(37, '567890123', 'Emilio', 'Ramírez López', 'Avenida 56 #78-90', 'Medellín', '+5745678901', 'emilio.ramirez@example.com'),
(38, '678901234', 'Abril', 'Hernández Martínez', 'Transversal 12 #34-56', 'Barranquilla', '+5756789012', 'abril.hernandez@example.com'),
(39, '789012345', 'Facundo', 'Díaz Gómez', 'Diagonal 78 #90-12', 'Cali', '+5767890123', 'facundo.diaz@example.com'),
(40, '890123456', 'Mía', 'López Ramírez', 'Calle 90 #12-34', 'Cartagena', '+5778901234', 'mia.lopez@example.com'),
(41, '901234567', 'Isaac', 'García Martínez', 'Avenida 67 #89-01', 'Bogotá', '+5712345678', 'isaac.garcia@example.com'),
(42, '123456780', 'Luna', 'Pérez Gómez', 'Transversal 34 #56-78', 'Medellín', '+5745678901', 'luna.perez@example.com'),
(43, '234567801', 'Simón', 'Gómez Díaz', 'Diagonal 45 #67-89', 'Barranquilla', '+5756789012', 'simon.gomez@example.com'),
(44, '345678912', 'Valentina', 'Ramírez López', 'Calle 23 #45-67', 'Cali', '+5767890123', 'valentina.ramirez@example.com'),
(45, '456789123', 'Mateo', 'Hernández Martínez', 'Avenida 56 #78-90', 'Cartagena', '+5778901234', 'mateo.hernandez@example.com'),
(46, '567891234', 'Renata', 'Díaz Gómez', 'Transversal 12 #34-56', 'Bogotá', '+5712345678', 'renata.diaz@example.com'),
(47, '678912345', 'Lucas', 'López Ramírez', 'Diagonal 78 #90-12', 'Medellín', '+5745678901', 'lucas.lopez@example.com'),
(48, '789123456', 'Martina', 'García Martínez', 'Calle 90 #12-34', 'Barranquilla', '+5756789012', 'martina.garcia@example.com'),
(49, '891234567', 'Joaquín', 'Pérez Gómez', 'Avenida 67 #89-01', 'Cali', '+5767890123', 'joaquin.perez@example.com'),
(50, '912345678', 'Antonella', 'Gómez Díaz', 'Transversal 34 #56-78', 'Cartagena', '+5778901234', 'antonella.gomez@example.com'),
(51, '987654321', 'Laura', 'Sánchez Gómez', 'Avenida 45 #56-78', 'Bogotá', '+5712345678', 'laura.sanchez@example.com'),
(52, '654321987', 'Juan', 'Martínez López', 'Transversal 23 #34-56', 'Medellín', '+5745678901', 'juan.martinez@example.com'),
(53, '321987654', 'Carolina', 'Gómez Pérez', 'Diagonal 67 #78-90', 'Barranquilla', '+5756789012', 'carolina.gomez@example.com'),
(54, '789012345', 'Diego', 'Ramírez Díaz', 'Calle 12 #45-67', 'Cali', '+5767890123', 'diego.ramirez@example.com'),
(55, '234567890', 'Valentina', 'Hernández Martínez', 'Avenida 78 #90-12', 'Cartagena', '+5778901234', 'valentina.hernandez@example.com'),
(56, '567890123', 'Santiago', 'López Gómez', 'Transversal 56 #78-90', 'Bogotá', '+5712345678', 'santiago.lopez@example.com'),
(57, '890123456', 'Gabriela', 'Pérez López', 'Diagonal 34 #56-78', 'Medellín', '+5745678901', 'gabriela.perez@example.com'),
(58, '123456789', 'Lucas', 'Gómez Ramírez', 'Calle 67 #89-01', 'Barranquilla', '+5756789012', 'lucas.gomez@example.com'),
(59, '456789012', 'Isabella', 'Martínez Díaz', 'Avenida 23 #45-67', 'Cali', '+5767890123', 'isabella.martinez@example.com'),
(60, '789012345', 'Matías', 'Ramírez Gómez', 'Transversal 45 #67-89', 'Cartagena', '+5778901234', 'matias.ramirez@example.com'),
(61, '234567890', 'Mariano', 'Hernández López', 'Diagonal 12 #34-56', 'Bogotá', '+5712345678', 'mariano.hernandez@example.com'),
(62, '567890123', 'Valeria', 'López Pérez', 'Calle 78 #90-12', 'Medellín', '+5745678901', 'valeria.lopez@example.com'),
(63, '890123456', 'Agustín', 'Gómez Ramírez', 'Avenida 56 #78-90', 'Barranquilla', '+5756789012', 'agustin.gomez@example.com'),
(64, '123456789', 'Camila', 'Pérez López', 'Transversal 34 #56-78', 'Cali', '+5767890123', 'camila.perez@example.com'),
(65, '456789012', 'Luciano', 'Ramírez Díaz', 'Diagonal 78 #90-12', 'Cartagena', '+5778901234', 'luciano.ramirez@example.com'),
(66, '789012345', 'Renata', 'Hernández Martínez', 'Calle 23 #45-67', 'Bogotá', '+5712345678', 'renata.hernandez@example.com'),
(67, '234567890', 'Martín', 'López Gómez', 'Avenida 45 #56-78', 'Medellín', '+5745678901', 'martin.lopez@example.com'),
(68, '567890123', 'Antonella', 'Pérez López', 'Transversal 23 #34-56', 'Barranquilla', '+5756789012', 'antonella.perez@example.com'),
(69, '890123456', 'Facundo', 'Gómez Pérez', 'Diagonal 67 #78-90', 'Cali', '+5767890123', 'facundo.gomez@example.com'),
(70, '123456789', 'Valentina', 'Ramírez Díaz', 'Calle 12 #45-67', 'Cartagena', '+5778901234', 'valentina.ramirez@example.com'),
(71, '234567890', 'Lorenzo', 'Hernández Martínez', 'Avenida 78 #90-12', 'Bogotá', '+5712345678', 'lorenzo.hernandez@example.com'),
(72, '567890123', 'Renata', 'López Gómez', 'Transversal 56 #78-90', 'Medellín', '+5745678901', 'renata.lopez@example.com'),
(73, '890123456', 'Simón', 'Pérez López', 'Diagonal 34 #56-78', 'Barranquilla', '+5756789012', 'simon.perez@example.com'),
(74, '123456789', 'Martina', 'Gómez Ramírez', 'Calle 67 #89-01', 'Cali', '+5767890123', 'martina.gomez@example.com'),
(75, '456789012', 'Emilio', 'Martínez Díaz', 'Avenida 23 #45-67', 'Cartagena', '+5778901234', 'emilio.martinez@example.com'),
(76, '789012345', 'Abril', 'Ramírez Gómez', 'Transversal 45 #67-89', 'Bogotá', '+5712345678', 'abril.ramirez@example.com'),
(77, '234567890', 'Facundo', 'Hernández López', 'Diagonal 12 #34-56', 'Medellín', '+5745678901', 'facundo.hernandez@example.com'),
(78, '567890123', 'Luna', 'López Pérez', 'Calle 78 #90-12', 'Barranquilla', '+5756789012', 'luna.lopez@example.com'),
(79, '890123456', 'Simón', 'Gómez Ramírez', 'Avenida 56 #78-90', 'Cali', '+5767890123', 'simon.gomez@example.com'),
(80, '123456789', 'Valentina', 'López Pérez', 'Transversal 34 #56-78', 'Cartagena', '+5778901234', 'valentina.lopez@example.com'),
(81, '234567890', 'Mariano', 'Hernández López', 'Diagonal 45 #67-89', 'Bogotá', '+5712345678', 'mariano.hernandez@example.com'),
(82, '567890123', 'Luciana', 'Ramírez Díaz', 'Calle 23 #45-67', 'Medellín', '+5745678901', 'luciana.ramirez@example.com'),
(83, '890123456', 'Agustín', 'Gómez Martínez', 'Avenida 56 #78-90', 'Barranquilla', '+5756789012', 'agustin.gomez@example.com'),
(84, '123456789', 'Camila', 'Pérez López', 'Transversal 12 #34-56', 'Cali', '+5767890123', 'camila.perez@example.com'),
(85, '456789012', 'Luciano', 'Ramírez Díaz', 'Diagonal 78 #90-12', 'Cartagena', '+5778901234', 'luciano.ramirez@example.com'),
(86, '789012345', 'Renata', 'Hernández Martínez', 'Calle 23 #45-67', 'Bogotá', '+5712345678', 'renata.hernandez@example.com'),
(87, '234567890', 'Martín', 'López Gómez', 'Avenida 45 #56-78', 'Medellín', '+5745678901', 'martin.lopez@example.com'),
(88, '567890123', 'Antonella', 'Pérez López', 'Transversal 23 #34-56', 'Barranquilla', '+5756789012', 'antonella.perez@example.com'),
(89, '890123456', 'Facundo', 'Gómez Pérez', 'Diagonal 67 #78-90', 'Cali', '+5767890123', 'facundo.gomez@example.com'),
(90, '123456789', 'Valentina', 'Ramírez Díaz', 'Calle 12 #45-67', 'Cartagena', '+5778901234', 'valentina.ramirez@example.com'),
(91, '234567890', 'Lorenzo', 'Hernández Martínez', 'Avenida 78 #90-12', 'Bogotá', '+5712345678', 'lorenzo.hernandez@example.com'),
(92, '567890123', 'Renata', 'López Gómez', 'Transversal 56 #78-90', 'Medellín', '+5745678901', 'renata.lopez@example.com'),
(93, '890123456', 'Simón', 'Pérez López', 'Diagonal 34 #56-78', 'Barranquilla', '+5756789012', 'simon.perez@example.com'),
(94, '123456789', 'Martina', 'Gómez Ramírez', 'Calle 67 #89-01', 'Cali', '+5767890123', 'martina.gomez@example.com'),
(95, '456789012', 'Emilio', 'Martínez Díaz', 'Avenida 23 #45-67', 'Cartagena', '+5778901234', 'emilio.martinez@example.com'),
(96, '789012345', 'Abril', 'Ramírez Gómez', 'Transversal 45 #67-89', 'Bogotá', '+5712345678', 'abril.ramirez@example.com'),
(97, '234567890', 'Facundo', 'Hernández López', 'Diagonal 12 #34-56', 'Medellín', '+5745678901', 'facundo.hernandez@example.com'),
(98, '567890123', 'Luna', 'López Pérez', 'Calle 78 #90-12', 'Barranquilla', '+5756789012', 'luna.lopez@example.com'),
(99, '890123456', 'Simón', 'Gómez Ramírez', 'Avenida 56 #78-90', 'Cali', '+5767890123', 'simon.gomez@example.com'),
(100, '912345678', 'Valentina', 'López Pérez', 'Transversal 34 #56-78', 'Cartagena', '+5778901234', 'valentina.lopez@example.com');



INSERT INTO vehiculo (id, tipo, placa, referencia, modelo, puertas, capacidad, sunroof, motor, color)
VALUES (1, 'sedan', 'ABC123', 'Toyota Corolla', '2023', 4, '5 personas', true, 'Motor 2.0', 'Blanco'),
(2, 'compacto', 'DEF456', 'Honda Civic', '2022', 4, '4 personas', false, 'Motor 1.8', 'Negro'),
(3, 'camioneta_platon', 'GHI789', 'Ford F-150', '2024', 2, '3 personas', true, 'Motor 3.5', 'Rojo'),
(4, 'camioneta_lujo', 'JKL012', 'Mercedes-Benz GLE', '2023', 4, '5 personas', true, 'Motor 3.0', 'Gris'),
(5, 'deportivo', 'MNO345', 'Chevrolet Camaro', '2022', 2, '2 personas', true, 'Motor 6.2', 'Azul'),
(6, 'sedan', 'PQR678', 'Hyundai Elantra', '2023', 4, '5 personas', false, 'Motor 1.6', 'Plateado'),
(7, 'compacto', 'STU901', 'Kia Rio', '2022', 4, '4 personas', false, 'Motor 1.4', 'Blanco'),
(8, 'camioneta_platon', 'VWX234', 'Toyota Hilux', '2024', 2, '3 personas', true, 'Motor 2.8', 'Negro'),
(9, 'camioneta_lujo', 'YZA567', 'BMW X5', '2023', 4, '5 personas', true, 'Motor 3.5', 'Rojo'),
(10, 'deportivo', 'BCD890', 'Ford Mustang', '2022', 2, '2 personas', true, 'Motor 5.0', 'Negro'),
(11, 'sedan', 'EFG123', 'Mazda 3', '2023', 4, '5 personas', false, 'Motor 2.5', 'Azul'),
(12, 'compacto', 'HIJ456', 'Volkswagen Golf', '2022', 4, '4 personas', false, 'Motor 1.8', 'Gris'),
(13, 'camioneta_platon', 'KLM789', 'Chevrolet Colorado', '2024', 2, '3 personas', true, 'Motor 2.7', 'Blanco'),
(14, 'camioneta_lujo', 'NOP012', 'Audi Q7', '2023', 4, '5 personas', true, 'Motor 3.0', 'Plateado'),
(15, 'deportivo', 'QRS345', 'Porsche 911', '2022', 2, '2 personas', true, 'Motor 3.8', 'Rojo'),
(16, 'sedan', 'TUV678', 'Nissan Sentra', '2023', 4, '5 personas', false, 'Motor 1.8', 'Negro'),
(17, 'compacto', 'WXY901', 'Ford Fiesta', '2022', 4, '4 personas', false, 'Motor 1.6', 'Plateado'),
(18, 'camioneta_platon', 'ZAB234', 'Toyota Tacoma', '2024', 2, '3 personas', true, 'Motor 2.7', 'Azul'),
(19, 'camioneta_lujo', 'CDE567', 'Lexus RX', '2023', 4, '5 personas', true, 'Motor 3.5', 'Gris'),
(20, 'deportivo', 'FGH890', 'BMW M4', '2022', 2, '2 personas', true, 'Motor 3.0', 'Blanco'),
(21, 'sedan', 'IJK123', 'Honda Accord', '2023', 4, '5 personas', false, 'Motor 2.0', 'Rojo'),
(22, 'compacto', 'LMN456', 'Chevrolet Spark', '2022', 4, '4 personas', false, 'Motor 1.2', 'Negro'),
(23, 'camioneta_platon', 'OPQ789', 'Mitsubishi L200', '2024', 2, '3 personas', true, 'Motor 2.4', 'Plateado'),
(24, 'camioneta_lujo', 'RST012', 'Volvo XC90', '2023', 4, '5 personas', true, 'Motor 2.0', 'Azul'),
(25, 'deportivo', 'UVW345', 'Ferrari 488', '2022', 2, '2 personas', true, 'Motor 3.9', 'Gris'),
(26, 'sedan', 'XYZ678', 'Hyundai Sonata', '2023', 4, '5 personas', false, 'Motor 2.4', 'Blanco'),
(27, 'compacto', 'ABC901', 'Toyota Yaris', '2022', 4, '4 personas', false, 'Motor 1.5', 'Rojo'),
(28, 'camioneta_platon', 'DEF234', 'Nissan Frontier', '2024', 2, '3 personas', true, 'Motor 2.5', 'Negro'),
(29, 'camioneta_lujo', 'GHI567', 'Mercedes-Benz GLC', '2023', 4, '5 personas', true, 'Motor 2.0', 'Plateado'),
(30, 'deportivo', 'JKL890', 'Audi R8', '2022', 2, '2 personas', true, 'Motor 5.2', 'Azul'),
(31, 'sedan', 'MNO123', 'Kia Optima', '2023', 4, '5 personas', false, 'Motor 2.0', 'Gris'),
(32, 'compacto', 'PQR456', 'Mazda 2', '2022', 4, '4 personas', false, 'Motor 1.5', 'Blanco'),
(33, 'camioneta_platon', 'STU789', 'Ford Ranger', '2024', 2, '3 personas', true, 'Motor 2.3', 'Rojo'),
(34, 'camioneta_lujo', 'VWX012', 'Range Rover Velar', '2023', 4, '5 personas', true, 'Motor 3.0', 'Negro'),
(35, 'deportivo', 'YZA345', 'Lamborghini Huracan', '2022', 2, '2 personas', true, 'Motor 5.2', 'Plateado'),
(36, 'sedan', 'BCD678', 'Subaru Impreza', '2023', 4, '5 personas', false, 'Motor 2.0', 'Azul'),
(37, 'compacto', 'EFG901', 'Volkswagen Polo', '2022', 4, '4 personas', false, 'Motor 1.6', 'Gris'),
(38, 'camioneta_platon', 'HIJ234', 'Chevrolet Silverado', '2024', 2, '3 personas', true, 'Motor 5.3', 'Blanco'),
(39, 'camioneta_lujo', 'KLM567', 'Jaguar F-Pace', '2023', 4, '5 personas', true, 'Motor 2.0', 'Rojo'),
(40, 'deportivo', 'NOP890', 'McLaren 720S', '2022', 2, '2 personas', true, 'Motor 4.0', 'Negro'),
(41, 'sedan', 'QRS123', 'Ford Fusion', '2023', 4, '5 personas', false, 'Motor 2.5', 'Plateado'),
(42, 'compacto', 'TUV456', 'Seat Ibiza', '2022', 4, '4 personas', false, 'Motor 1.0', 'Azul'),
(43, 'camioneta_platon', 'WXY789', 'Toyota Tundra', '2024', 2, '3 personas', true, 'Motor 5.7', 'Gris'),
(44, 'camioneta_lujo', 'ZAB012', 'Audi Q5', '2023', 4, '5 personas', true, 'Motor 2.0', 'Blanco'),
(45, 'deportivo', 'CDE345', 'BMW i8', '2022', 2, '2 personas', true, 'Motor 1.5', 'Rojo'),
(46, 'sedan', 'FGH678', 'Hyundai Accent', '2023', 4, '5 personas', false, 'Motor 1.6', 'Negro'),
(47, 'compacto', 'IJK901', 'Renault Clio', '2022', 4, '4 personas', false, 'Motor 1.2', 'Plateado'),
(48, 'camioneta_platon', 'LMN234', 'Ford Bronco', '2024', 2, '3 personas', true, 'Motor 2.7', 'Azul'),
(49, 'camioneta_lujo', 'OPQ567', 'Volvo XC60', '2023', 4, '5 personas', true, 'Motor 2.0', 'Gris'),
(50, 'deportivo', 'RST890', 'Porsche Cayman', '2022', 2, '2 personas', true, 'Motor 2.0', 'Blanco'),
(51, 'sedan', 'UVW123', 'Toyota Camry', '2023', 4, '5 personas', false, 'Motor 2.5', 'Negro'),
(52, 'compacto', 'XYZ456', 'Honda Fit', '2022', 4, '4 personas', false, 'Motor 1.5', 'Blanco'),
(53, 'camioneta_platon', 'ABC789', 'Chevrolet S10', '2024', 2, '3 personas', true, 'Motor 2.8', 'Rojo'),
(54, 'camioneta_lujo', 'DEF012', 'Lexus NX', '2023', 4, '5 personas', true, 'Motor 2.5', 'Plateado'),
(55, 'deportivo', 'GHI345', 'Ford GT', '2022', 2, '2 personas', true, 'Motor 3.5', 'Azul'),
(56, 'sedan', 'JKL678', 'Nissan Altima', '2023', 4, '5 personas', false, 'Motor 2.0', 'Gris'),
(57, 'compacto', 'MNO901', 'Volkswagen Up!', '2022', 4, '4 personas', false, 'Motor 1.0', 'Blanco'),
(58, 'camioneta_platon', 'PQR234', 'Mazda BT-50', '2024', 2, '3 personas', true, 'Motor 3.2', 'Negro'),
(59, 'camioneta_lujo', 'STU567', 'Acura MDX', '2023', 4, '5 personas', true, 'Motor 3.5', 'Rojo'),
(60, 'deportivo', 'VWX890', 'Chevrolet Corvette', '2022', 2, '2 personas', true, 'Motor 6.2', 'Plateado'),
(61, 'sedan', 'YZA123', 'Hyundai Accent', '2023', 4, '5 personas', false, 'Motor 1.6', 'Azul'),
(62, 'compacto', 'BCD456', 'Renault Sandero', '2022', 4, '4 personas', false, 'Motor 1.2', 'Gris'),
(63, 'camioneta_platon', 'EFG789', 'Toyota Land Cruiser', '2024', 2, '3 personas', true, 'Motor 4.5', 'Blanco'),
(64, 'camioneta_lujo', 'HIJ012', 'Land Rover Discovery', '2023', 4, '5 personas', true, 'Motor 3.0', 'Negro'),
(65, 'deportivo', 'KLM345', 'Ferrari F8 Tributo', '2022', 2, '2 personas', true, 'Motor 3.9', 'Rojo'),
(66, 'sedan', 'NOP678', 'Kia Forte', '2023', 4, '5 personas', false, 'Motor 2.0', 'Plateado'),
(67, 'compacto', 'QRS901', 'Mazda 2', '2022', 4, '4 personas', false, 'Motor 1.5', 'Blanco'),
(68, 'camioneta_platon', 'TUV234', 'Ford F-250', '2024', 2, '3 personas', true, 'Motor 6.7', 'Negro'),
(69, 'camioneta_lujo', 'WXY567', 'Porsche Cayenne', '2023', 4, '5 personas', true, 'Motor 3.0', 'Plateado'),
(70, 'deportivo', 'ZAB890', 'Lamborghini Aventador', '2022', 2, '2 personas', true, 'Motor 6.5', 'Azul'),
(71, 'sedan', 'CDE123', 'Subaru Legacy', '2023', 4, '5 personas', false, 'Motor 2.5', 'Gris'),
(72, 'compacto', 'FGH456', 'Seat Ibiza', '2022', 4, '4 personas', false, 'Motor 1.0', 'Blanco'),
(73, 'camioneta_platon', 'IJK789', 'Chevrolet Silverado', '2024', 2, '3 personas', true, 'Motor 5.3', 'Rojo'),
(74, 'camioneta_lujo', 'LMN012', 'Mercedes-Benz GLE', '2023', 4, '5 personas', true, 'Motor 3.0', 'Plateado'),
(75, 'deportivo', 'OPQ345', 'Audi RS5', '2022', 2, '2 personas', true, 'Motor 2.9', 'Negro'),
(76, 'sedan', 'RST678', 'Toyota Camry', '2023', 4, '5 personas', false, 'Motor 2.5', 'Rojo'),
(77, 'compacto', 'UVW901', 'Honda Fit', '2022', 4, '4 personas', false, 'Motor 1.5', 'Plateado'),
(78, 'camioneta_platon', 'XYZ234', 'Ford Ranger', '2024', 2, '3 personas', true, 'Motor 2.3', 'Azul'),
(79, 'camioneta_lujo', 'ABC567', 'Audi Q7', '2023', 4, '5 personas', true, 'Motor 3.0', 'Gris'),
(80, 'deportivo', 'DEF890', 'Chevrolet Camaro', '2022', 2, '2 personas', true, 'Motor 6.2', 'Blanco'),
(81, 'sedan', 'GHI123', 'Nissan Altima', '2023', 4, '5 personas', false, 'Motor 2.0', 'Negro'),
(82, 'compacto', 'JKL456', 'Volkswagen Up!', '2022', 4, '4 personas', false, 'Motor 1.0', 'Rojo'),
(83, 'camioneta_platon', 'MNO789', 'Toyota Tundra', '2024', 2, '3 personas', true, 'Motor 5.7', 'Plateado'),
(84, 'camioneta_lujo', 'PQR012', 'Volvo XC90', '2023', 4, '5 personas', true, 'Motor 2.0', 'Azul'),
(85, 'deportivo', 'STU345', 'Porsche 911', '2022', 2, '2 personas', true, 'Motor 3.8', 'Gris'),
(86, 'sedan', 'VWX678', 'Hyundai Sonata', '2023', 4, '5 personas', false, 'Motor 2.4', 'Blanco'),
(87, 'compacto', 'YZA901', 'Toyota Yaris', '2022', 4, '4 personas', false, 'Motor 1.5', 'Rojo'),
(88, 'camioneta_platon', 'BCD234', 'Mitsubishi L200', '2024', 2, '3 personas', true, 'Motor 2.4', 'Negro'),
(89, 'camioneta_lujo', 'EFG567', 'Lexus RX', '2023', 4, '5 personas', true, 'Motor 3.5', 'Plateado'),
(90, 'deportivo', 'HIJ890', 'BMW M4', '2022', 2, '2 personas', true, 'Motor 3.0', 'Azul'),
(91, 'sedan', 'KLM123', 'Kia Optima', '2023', 4, '5 personas', false, 'Motor 2.0', 'Gris'),
(92, 'compacto', 'NOP456', 'Mazda 2', '2022', 4, '4 personas', false, 'Motor 1.5', 'Blanco'),
(93, 'camioneta_platon', 'QRS789', 'Ford F-150', '2024', 2, '3 personas', true, 'Motor 3.5', 'Negro'),
(94, 'camioneta_lujo', 'TUV012', 'BMW X5', '2023', 4, '5 personas', true, 'Motor 3.5', 'Rojo'),
(95, 'deportivo', 'WXY345', 'Chevrolet Corvette', '2022', 2, '2 personas', true, 'Motor 6.2', 'Plateado'),
(96, 'sedan', 'ZAB678', 'Ford Fusion', '2023', 4, '5 personas', false, 'Motor 2.5', 'Azul'),
(97, 'compacto', 'CDE901', 'Seat Ibiza', '2022', 4, '4 personas', false, 'Motor 1.6', 'Gris'),
(98, 'camioneta_platon', 'FGH234', 'Chevrolet Silverado', '2024', 2, '3 personas', true, 'Motor 5.3', 'Blanco'),
(99, 'camioneta_lujo', 'IJK567', 'Jaguar F-Pace', '2023', 4, '5 personas', true, 'Motor 2.0', 'Rojo'),
(100, 'deportivo', 'LMN890', 'McLaren 720S', '2022', 2, '2 personas', true, 'Motor 4.0', 'Negro');

INSERT INTO alquiler (id,id_cliente, id_empleado, id_sucursal_salida, id_sucursal_entrada, sunroof, fecha_salida, fecha_llegada, fecha_esperada_llegada, valor_alquiler_semana, porcentaje_descuento, valor_cotizado, valor_pagado)
VALUES (1, 1, 3, 2, 1, true, '2024-07-01', '2024-07-05', '2024-07-05', 500, 10, 450, 450),
(2, 2, 4, 1, 3, false, '2024-08-15', '2024-08-23', '2024-08-23', 400, 5, 380, 380),
(3, 3, 2, 4, 5, true, '2024-09-15', '2024-09-16', '2024-09-16', 600, 15, 510, 510),
(4, 4, 1, 5, 2, false, '2024-10-10', '2024-10-20', '2024-10-20', 700, 10, 630, 630),
(5, 5, 5, 3, 4, true, '2024-11-25', '2024-12-02', '2024-12-01', 550, 5, 522.5, 522),
(6, 6, 3, 2, 1, true, '2024-07-03', '2024-07-12', '2024-07-12', 520, 10, 468, 468),
(7, 7, 4, 1, 3, false, '2024-08-20', '2024-08-28', '2024-08-28', 420, 5, 399, 399),
(8, 8, 2, 4, 5, true, '2024-09-10', '2024-09-20', '2024-09-20', 640, 15, 544, 544),
(9, 9, 1, 5, 2, false, '2024-10-15', '2024-10-25', '2024-10-25', 770, 10, 693, 693),
(10, 10, 5, 3, 4, true, '2024-11-30', '2024-12-07', '2024-12-07', 605, 5, 574.75, 574.75),
(11, 11, 3, 2, 1, true, '2024-07-05', '2024-07-14', '2024-07-14', 540, 10, 486, 486),
(12, 12, 4, 1, 3, false, '2024-08-25', '2024-09-02', '2024-09-02', 440, 5, 418, 418),
(13, 13, 2, 4, 5, true, '2024-09-15', '2024-09-25', '2024-09-25', 680, 15, 578, 578),
(14, 14, 1, 5, 2, false, '2024-10-20', '2024-10-30', '2024-10-30', 735, 10, 661.5, 661.5),
(15, 15, 5, 3, 4, true, '2024-12-05', '2024-12-12', '2024-12-12', 575, 5, 546.25, 546.25),
(16, 16, 3, 2, 1, true, '2024-07-07', '2024-07-16', '2024-07-16', 560, 10, 504, 504),
(17, 17, 4, 1, 3, false, '2024-08-30', '2024-09-07', '2024-09-07', 460, 5, 437, 437),
(18, 18, 2, 4, 5, true, '2024-09-20', '2024-09-30', '2024-09-30', 700, 15, 595, 595),
(19, 19, 1, 5, 2, false, '2024-10-25', '2024-11-04', '2024-11-04', 805, 10, 724.5, 724.5),
(20, 20, 5, 3, 4, true, '2024-12-10', '2024-12-17', '2024-12-17', 600, 5, 570, 570),
(21, 21, 3, 2, 1, true, '2024-07-10', '2024-07-19', '2024-07-19', 580, 10, 522, 522),
(22, 22, 4, 1, 3, false, '2024-09-05', '2024-09-13', '2024-09-13', 480, 5, 456, 456),
(23, 23, 2, 4, 5, true, '2024-09-25', '2024-10-05', '2024-10-05', 720, 15, 612, 612),
(24, 24, 1, 5, 2, false, '2024-11-01', '2024-11-11', '2024-11-11', 840, 10, 756, 756),
(25, 25, 5, 3, 4, true, '2024-12-15', '2024-12-22', '2024-12-22', 625, 5, 593.75, 593.75),
(26, 26, 3, 2, 1, true, '2024-07-12', '2024-07-21', '2024-07-21', 600, 10, 540, 540),
(27, 27, 4, 1, 3, false, '2024-09-10', '2024-09-18', '2024-09-18', 500, 5, 475, 475),
(28, 28, 2, 4, 5, true, '2024-10-05', '2024-10-15', '2024-10-15', 740, 15, 629, 629),
(29, 29, 1, 5, 2, false, '2024-11-10', '2024-11-20', '2024-11-20', 875, 10, 787.5, 787.5),
(30, 30, 5, 3, 4, true, '2024-12-20', '2024-12-27', '2024-12-27', 650, 5, 617.5, 617.5),
(31, 31, 3, 2, 1, true, '2024-07-15', '2024-07-24', '2024-07-24', 620, 10, 558, 558),
(32, 32, 4, 1, 3, false, '2024-09-15', '2024-09-23', '2024-09-23', 520, 5, 494, 494),
(33, 33, 2, 4, 5, true, '2024-10-01', '2024-10-11', '2024-10-11', 760, 15, 646, 646),
(34, 34, 1, 5, 2, false, '2024-11-05', '2024-11-15', '2024-11-15', 910, 10, 819, 819),
(35, 35, 5, 3, 4, true, '2024-12-25', '2025-01-01', '2025-01-01', 675, 5, 641.25, 641.25),
(36, 36, 3, 2, 1, true, '2024-07-17', '2024-07-26', '2024-07-26', 640, 10, 576, 576),
(37, 37, 4, 1, 3, false, '2024-09-20', '2024-09-28', '2024-09-28', 540, 5, 513, 513),
(38, 38, 2, 4, 5, true, '2024-10-10', '2024-10-20', '2024-10-20', 780, 15, 663, 663),
(39, 39, 1, 5, 2, false, '2024-11-15', '2024-11-25', '2024-11-25', 945, 10, 850.5, 850.5),
(40, 40, 5, 3, 4, true, '2025-01-05', '2025-01-12', '2025-01-12', 700, 5, 665, 665),
(41, 41, 3, 2, 1, true, '2024-07-20', '2024-07-29', '2024-07-29', 660, 10, 594, 594),
(42, 42, 4, 1, 3, false, '2024-09-25', '2024-10-03', '2024-10-03', 560, 5, 532, 532),
(43, 43, 2, 4, 5, true, '2024-10-15', '2024-10-25', '2024-10-25', 800, 15, 680, 680),
(44, 44, 1, 5, 2, false, '2024-11-20', '2024-11-30', '2024-11-30', 980, 10, 882, 882),
(45, 45, 5, 3, 4, true, '2025-01-15', '2025-01-22', '2025-01-22', 725, 5, 688.75, 688.75),
(46, 46, 3, 2, 1, true, '2024-07-22', '2024-07-31', '2024-07-31', 680, 10, 612, 612),
(47, 47, 4, 1, 3, false, '2024-09-30', '2024-10-08', '2024-10-08', 580, 5, 551, 551),
(48, 48, 2, 4, 5, true, '2024-10-20', '2024-10-30', '2024-10-30', 820, 15, 697, 697),
(49, 49, 1, 5, 2, false, '2024-11-25', '2024-12-05', '2024-12-05', 1015, 10, 913.5, 913.5),
(50, 50, 5, 3, 4, true, '2025-01-25', '2025-02-01', '2025-02-01', 750, 5, 712.5, 712.5),
(51, 51, 3, 2, 1, true, '2024-07-10', '2024-07-19', '2024-07-19', 580, 10, 522, 522),
(52, 52, 4, 1, 3, false, '2024-09-05', '2024-09-13', '2024-09-13', 480, 5, 456, 456),
(53, 53, 2, 4, 5, true, '2024-09-25', '2024-10-05', '2024-10-05', 720, 15, 612, 612),
(54, 54, 1, 5, 2, false, '2024-11-01', '2024-11-11', '2024-11-11', 840, 10, 756, 756),
(55, 55, 5, 3, 4, true, '2024-12-15', '2024-12-22', '2024-12-22', 625, 5, 593.75, 593.75),
(56, 56, 3, 2, 1, true, '2024-07-12', '2024-07-21', '2024-07-21', 600, 10, 540, 540),
(57, 57, 4, 1, 3, false, '2024-09-10', '2024-09-18', '2024-09-18', 500, 5, 475, 475),
(58, 58, 2, 4, 5, true, '2024-10-05', '2024-10-15', '2024-10-15', 740, 15, 629, 629),
(59, 59, 1, 5, 2, false, '2024-11-10', '2024-11-20', '2024-11-20', 875, 10, 787.5, 787.5),
(60, 60, 5, 3, 4, true, '2024-12-20', '2024-12-27', '2024-12-27', 650, 5, 617.5, 617.5),
(61, 61, 3, 2, 1, true, '2024-07-15', '2024-07-24', '2024-07-24', 620, 10, 558, 558),
(62, 62, 4, 1, 3, false, '2024-09-15', '2024-09-23', '2024-09-23', 520, 5, 494, 494),
(63, 63, 2, 4, 5, true, '2024-10-01', '2024-10-11', '2024-10-11', 760, 15, 646, 646),
(64, 64, 1, 5, 2, false, '2024-11-05', '2024-11-15', '2024-11-15', 910, 10, 819, 819),
(65, 65, 5, 3, 4, true, '2024-12-25', '2025-01-01', '2024-01-01', 675, 5, 641.25, 641.25),
(66, 66, 3, 2, 1, true, '2024-07-22', '2024-07-31', '2024-07-31', 680, 10, 612, 612),
(67, 67, 4, 1, 3, false, '2024-09-30', '2024-10-08', '2024-10-08', 580, 5, 551, 551),
(68, 68, 2, 4, 5, true, '2024-10-10', '2024-10-20', '2024-10-20', 780, 15, 663, 663),
(69, 69, 1, 5, 2, false, '2024-11-15', '2024-11-25', '2024-11-25', 945, 10, 850.5, 850.5),
(70, 70, 5, 3, 4, true, '2025-01-05', '2025-01-12', '2025-01-12', 700, 5, 665, 665),
(71, 71, 3, 2, 1, true, '2024-07-20', '2024-07-29', '2024-07-29', 660, 10, 594, 594),
(72, 72, 4, 1, 3, false, '2024-09-25', '2024-10-03', '2024-10-03', 560, 5, 532, 532),
(73, 73, 2, 4, 5, true, '2024-10-15', '2024-10-25', '2024-10-25', 800, 15, 680, 680),
(74, 74, 1, 5, 2, false, '2024-11-20', '2024-11-30', '2024-11-30', 980, 10, 882, 882),
(75, 75, 5, 3, 4, true, '2025-01-10', '2025-01-17', '2025-01-17', 725, 5, 688.75, 688.75),
(76, 76, 3, 2, 1, true, '2024-07-22', '2024-07-31', '2024-07-31', 680, 10, 612, 612),
(77, 77, 4, 1, 3, false, '2024-09-10', '2024-09-18', '2024-09-18', 480, 5, 456, 456),
(78, 78, 2, 4, 5, true, '2024-09-30', '2024-10-10', '2024-10-10', 720, 15, 612, 612),
(79, 79, 1, 5, 2, false, '2024-10-25', '2024-11-04', '2024-11-04', 805, 10, 724.5, 724.5),
(80, 80, 5, 3, 4, true, '2024-12-10', '2024-12-17', '2024-12-17', 600, 5, 570, 570),
(81, 81, 3, 2, 1, true, '2024-07-10', '2024-07-19', '2024-07-19', 580, 10, 522, 522),
(82, 82, 4, 1, 3, false, '2024-09-05', '2024-09-13', '2024-09-13', 480, 5, 456, 456),
(83, 83, 2, 4, 5, true, '2024-09-25', '2024-10-05', '2024-10-05', 720, 15, 612, 612),
(84, 84, 1, 5, 2, false, '2024-11-01', '2024-11-11', '2024-11-11', 840, 10, 756, 756),
(85, 85, 5, 3, 4, true, '2024-12-15', '2024-12-22', '2024-12-22', 625, 5, 593.75, 593.75),
(86, 86, 3, 2, 1, true, '2024-07-12', '2024-07-21', '2024-07-21', 600, 10, 540, 540),
(87, 87, 4, 1, 3, false, '2024-09-10', '2024-09-18', '2024-09-18', 500, 5, 475, 475),
(88, 88, 2, 4, 5, true, '2024-10-05', '2024-10-15', '2024-10-15', 740, 15, 629, 629),
(89, 89, 1, 5, 2, false, '2024-11-10', '2024-11-20', '2024-11-20', 875, 10, 787.5, 787.5),
(90, 90, 5, 3, 4, true, '2024-12-20', '2024-12-27', '2024-12-27', 650, 5, 617.5, 617.5),
(91, 91, 3, 2, 1, true, '2024-07-15', '2024-07-24', '2024-07-24', 620, 10, 558, 558),
(92, 92, 4, 1, 3, false, '2024-09-15', '2024-09-23', '2024-09-23', 520, 5, 494, 494),
(93, 93, 2, 4, 5, true, '2024-10-01', '2024-10-11', '2024-10-11', 760, 15, 646, 646),
(94, 94, 1, 5, 2, false, '2024-11-05', '2024-11-15', '2024-11-15', 910, 10, 819, 819),
(95, 95, 5, 3, 4, true, '2024-12-25', '2025-01-01', '2024-01-01', 675, 5, 641.25, 641.25),
(96, 96, 3, 2, 1, true, '2024-07-22', '2024-07-31', '2024-07-31', 580, 10, 522, 522),
(97, 97, 4, 1, 3, false, '2024-09-10', '2024-09-18', '2024-09-18', 480, 5, 456, 456),
(98, 98, 2, 4, 5, true, '2024-09-30', '2024-10-10', '2024-10-10', 720, 15, 612, 612),
(99, 99, 1, 5, 2, false, '2024-10-25', '2024-11-04', '2024-11-04', 805, 10, 724.5, 724.5),
(100, 100, 5, 3, 4, true, '2024-12-10', '2024-12-17', '2024-12-17', 600, 5, 570, 570);


INSERT INTO sesion (id, id_usuario, ultima_vez) 
VALUES (1, 1, '2024-06-01'),
(2, 2, '2024-06-02'),
(3, 3, '2024-06-03'),
(4, 4, '2024-06-04'),
(5, 5, '2024-06-05'),
(6, 6, '2024-06-06'),
(7, 7, '2024-06-07'),
(8, 8, '2024-06-08'),
(9, 9, '2024-06-09'),
(10, 10, '2024-06-10'),
(11, 11, '2024-06-11'),
(12, 12, '2024-06-12'),
(13, 13, '2024-06-13'),
(14, 14, '2024-06-14'),
(15, 15, '2024-06-15'),
(16, 16, '2024-06-16'),
(17, 17, '2024-06-17'),
(18, 18, '2024-06-18'),
(19, 19, '2024-06-19'),
(20, 20, '2024-06-20'),
(21, 21, '2024-06-21'),
(22, 22, '2024-06-22'),
(23, 23, '2024-06-23'),
(24, 24, '2024-06-24'),
(25, 25, '2024-06-25'),
(26, 26, '2024-06-26'),
(27, 27, '2024-06-27'),
(28, 28, '2024-06-28'),
(29, 29, '2024-06-29'),
(30, 30, '2024-06-30'),
(31, 31, '2024-07-01'),
(32, 32, '2024-07-02'),
(33, 33, '2024-07-03'),
(34, 34, '2024-07-04'),
(35, 35, '2024-07-05'),
(36, 36, '2024-07-06'),
(37, 37, '2024-07-07'),
(38, 38, '2024-07-08'),
(39, 39, '2024-07-09'),
(40, 40, '2024-07-10'),
(41, 41, '2024-07-11'),
(42, 42, '2024-07-12'),
(43, 43, '2024-07-13'),
(44, 44, '2024-07-14'),
(45, 45, '2024-07-15'),
(46, 46, '2024-07-16'),
(47, 47, '2024-07-17'),
(48, 48, '2024-07-18'),
(49, 49, '2024-07-19'),
(50, 50, '2024-07-20');



-- Creación de usuarios 

CREATE ROLE admini;
CREATE ROLE empleado;
CREATE ROLE cliente;

-- All permissies

GRANT ALL PRIVILEGES ON *.* TO 'administrador';

-- Permisos específicos para empleados

GRANT SELECT, INSERT, UPDATE ON `alquiler` TO 'empleado';
GRANT SELECT, INSERT, UPDATE ON `vehiculo` TO 'empleado';
GRANT SELECT ON `cliente` TO 'empleado';

-- Permisos específicos para clientes

GRANT SELECT, INSERT ON `alquiler` TO 'cliente';
GRANT SELECT ON `vehiculo` TO 'cliente';
GRANT SELECT, INSERT ON `usuario` TO 'cliente';

-- Administrador

CREATE USER 'admini'@'localhost' IDENTIFIED BY 'adminpass';
GRANT administrador TO 'admin'@'localhost';
SET DEFAULT ROLE administrador FOR 'admin'@'localhost';

 
-- Empleados
CREATE USER 'empleado1'@'localhost' IDENTIFIED BY 'emppass1';
GRANT empleado TO 'empleado1'@'localhost';
SET DEFAULT ROLE empleado FOR 'empleado1'@'localhost';

CREATE USER 'empleado2'@'localhost' IDENTIFIED BY 'emppass2';
GRANT empleado TO 'empleado2'@'localhost';
SET DEFAULT ROLE empleado FOR 'empleado2'@'localhost';


-- Clientes
CREATE USER 'cliente1'@'localhost' IDENTIFIED BY 'clientpass1';
GRANT cliente TO 'cliente1'@'localhost';
SET DEFAULT ROLE cliente FOR 'cliente1'@'localhost';

CREATE USER 'cliente2'@'localhost' IDENTIFIED BY 'clientpass2';
GRANT cliente TO 'cliente2'@'localhost';
SET DEFAULT ROLE cliente FOR 'cliente2'@'localhost';


-- Crear usuarios clientes
CREATE USER 'cliente1'@'localhost' IDENTIFIED BY 'clientpass1';
GRANT cliente TO 'cliente1'@'localhost';
SET DEFAULT ROLE cliente FOR 'cliente1'@'localhost';

CREATE USER 'cliente2'@'localhost' IDENTIFIED BY 'clientpass2';
GRANT cliente TO 'cliente2'@'localhost';
SET DEFAULT ROLE cliente FOR 'cliente2'@'localhost';

-- Aplicar cambios
FLUSH PRIVILEGES;

-- ################################
-- Consultas 

-- login 

SELECT * FROM usuario WHERE nombre_usuario = 'jdoe2@email.com' AND contraseña = 'hashedpassword2' ;

-- Disponibilidad para alquilar 

SELECT * FROM vehiculo
WHERE tipo = 'sedan'
  AND id NOT IN (
    SELECT 2 FROM alquiler
    WHERE fecha_salida <= '2024-09-25' AND fecha_llegada >= '2024-10-03'
  );


-- Procedimiento para registrar un nuevo alquiler 

DELIMITER //

CREATE PROCEDURE registrar_alquiler(
    IN p_id_cliente INT,
    IN p_id_empleado INT,
    IN p_id_vehiculo INT,
    IN p_id_sucursal_salida INT,
    IN p_id_sucursal_entrada INT,
    IN p_fecha_salida DATE,
    IN p_fecha_llegada DATE,
    IN p_fecha_esperada_llegada DATE,
    IN p_valor_alquiler_semana DECIMAL,
    IN p_porcentaje_descuento DECIMAL,
    IN p_valor_cotizado DECIMAL,
    IN p_valor_pagado DECIMAL
)
BEGIN
    INSERT INTO alquiler (
        id_cliente, id_empleado, id_vehiculo, id_sucursal_salida, id_sucursal_entrada, 
        fecha_salida, fecha_llegada, fecha_esperada_llegada, 
        valor_alquiler_semana, porcentaje_descuento, valor_cotizado, valor_pagado
    )
    VALUES (
        p_id_cliente, p_id_empleado, p_id_vehiculo, p_id_sucursal_salida, p_id_sucursal_entrada, 
        p_fecha_salida, p_fecha_llegada, p_fecha_esperada_llegada, 
        p_valor_alquiler_semana, p_porcentaje_descuento, p_valor_cotizado, p_valor_pagado
    );
END //

DELIMITER ;

-- Procedimiento para consultar el historial de alquileres de un cliente 

DELIMITER //

CREATE PROCEDURE consultar_historial_alquileres(
    IN p_id_cliente INT
)
BEGIN
    SELECT a.id, a.id_vehiculo, a.id_sucursal_salida, a.id_sucursal_entrada, a.fecha_salida, a.fecha_llegada, a.fecha_esperada_llegada, a.valor_alquiler_semana, a.porcentaje_descuento, a.valor_cotizado, a.valor_pagado
    FROM alquiler a
    WHERE a.id_cliente = p_id_cliente;
END //

DELIMITER ;


-- Llamado del procedimiento con id cliente 

CALL consultar_historial_alquileres(1); 


-- Procedimiento de iniciar sesion 

DELIMITER //

CREATE PROCEDURE iniciar_sesion(
    IN p_email VARCHAR(40),
    IN p_contraseña VARCHAR(30)
)
BEGIN
    SELECT id, nombre_usuario, email, rol
    FROM usuario
    WHERE email = p_email
    AND contraseña = p_contraseña;
END //

DELIMITER ;


-- Llamado del procedimiento 

CALL iniciar_sesion(
    'usuario1@example.com', -- email
    'password123' -- contraseña
);


-- Evento 

-- Enviar mensaje por dia pasado 

CREATE EVENT daily_reminder
ON SCHEDULE EVERY 1 DAY
DO
BEGIN
    INSERT INTO recordatorio (id_cliente, mensaje, fecha_envio)
    SELECT id_cliente, CONCAT('Recuerde devolver el vehículo mañana: ', fecha_esperada_llegada), CURDATE()
    FROM alquiler
    WHERE fecha_esperada_llegada = CURDATE() + INTERVAL 1 DAY;
END ;

-- Cambiar estado luego de un vehiculo ser entregado 

CREATE EVENT update_vehiculo_estado
ON SCHEDULE EVERY 1 DAY
DO
BEGIN
    UPDATE vehiculo v
    INNER JOIN alquiler a ON v.id = a.id_vehiculo
    SET v.estado = 'disponible'
    WHERE a.fecha_esperada_llegada < CURDATE() 
      AND v.estado = 'alquilado'
      AND a.fecha_llegada IS NULL;
END ;

-- Trigger actualizar la ultima sesion del usuario 


CREATE TRIGGER after_login_update_session
AFTER INSERT ON sesion
FOR EACH ROW
BEGIN
    UPDATE usuario
    SET ultima_sesion = NEW.ultima_vez
    WHERE id = NEW.id_usuario;
END ;


-- link para visualizar doc de informe 

https://drive.google.com/file/d/1SI1rGcTCwhDXV9VJEsE5E3-e_8SoQmab/view?usp=sharing


-- ## DESARROLLADO POR BRAYAN YESID LINDARTE ANAYA - D.I. 1010120365

