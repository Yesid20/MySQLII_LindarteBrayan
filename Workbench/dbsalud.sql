-- ##########################################
-- ### Fortalecimiento -- ###################
-- ##########################################

-- Creación de bd 

CREATE DATABASE salud;

-- Uso de la bd creada 

use salud;

-- Creación de tablas

CREATE TABLE medico (
	id INT (10) AUTO_INCREMENT PRIMARY KEY, 
    nombre VARCHAR (40) NOT NULL, 
    direccion VARCHAR (50) NOT NULL, 
    telefono INT (15) NOT NULL, 
    población VARCHAR (30) NOT NULL, 
    provincia VARCHAR (20) NOT NULL,
    codigo_postal INT (15) NOT NULL, 
	nif INT (20) NOT NULL, 
    seguridad_social INT (30) NOT NULL,
    colegiado INT(30) NOT NULL,
    tipo ENUM('titular', 'interino', 'sustituto')
); 

ALTER TABLE medico MODIFY COLUMN telefono VARCHAR(15) NOT NULL;


CREATE TABLE empleado (
	id INT (10) AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR (40) NOT NULL, 
    direccion VARCHAR (50) NOT NULL,
    telefono INT (15) NOT NULL,
    poblacion VARCHAR (30)NOT NULL,
    provincia VARCHAR (20) NOT NULL,
    codigo_postal INT (15) NOT NULL, 
    NIF INT (20) NOT NULL,
    seguridad_social INT (30),
    tipo_ats ENUM ('zona', 'auxiliares_enfermeria', 'celadores', 'administrativos') NOT NULL
);

ALTER TABLE empleado MODIFY COLUMN telefono VARCHAR(15) NOT NULL;


CREATE TABLE paciente (
	id INT (10) AUTO_INCREMENT PRIMARY KEY, 
    id_medico INT (10) NOT NULL,
    nombre VARCHAR (40) NOT NULL, 
    direccion VARCHAR (50) NOT NULL, 
    telefono INT (15) NOT NULL, 
    codigo_postal INT (15) NOT NULL, 
	nif INT (20) NOT NULL, 
    seguridad_social INT (30) NOT NULL,
    colegiado INT(30) NOT NULL,
    tipo ENUM('titular', 'interino', 'sustituto'),
    FOREIGN KEY (id_medico) REFERENCES medico(id)
);

ALTER TABLE paciente MODIFY COLUMN telefono VARCHAR(15) NOT NULL;
ALTER TABLE paciente DROP COLUMN colegiado;



CREATE TABLE sustitucion (
	id INT (10) AUTO_INCREMENT PRIMARY KEY, 
    fechas_alta DATE NOT NULL,
    fechas_baja DATE NOT NULL,
	id_medico_temporal INT (10) NOT NULL,
    FOREIGN KEY (id_medico_temporal) REFERENCES medico(id)
);

CREATE TABLE vacaciones (
	id INT (10) AUTO_INCREMENT PRIMARY KEY,
    id_profesional INT (10) NOT NULL,
    tipo_profesional ENUM ('medico','empleado') NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL, 
    FOREIGN KEY (id_profesional) REFERENCES empleado(id)
);

CREATE TABLE horario_consulta (
	id INT (10) AUTO_INCREMENT PRIMARY KEY,
    id_medico INT (10) NOT NULL,
    id_paciente INT (10) NOT NULL,
    fecha DATE, 
    hora_inicio TIME NOT NULL,
    hora_fin TIME NOT NULL, 
    FOREIGN KEY (id_medico) REFERENCES medico(id),
    FOREIGN KEY (id_paciente) REFERENCES paciente(id)
);

-- Inserciones a las tablas creadas 

INSERT INTO medico (nombre, direccion, telefono, población, provincia, codigo_postal, nif, seguridad_social, colegiado, tipo)
VALUES 
('Dr. Juan Perez', 'Calle 123', '3001234567', 'Bogotá', 'Bogotá', '110111', '123456789', '987654321', '1001', 'titular'),
('Dr. Maria Gomez', 'Carrera 45', '3009876543', 'Medellín', 'Antioquia', '050001', '223456789', '987654322', '1002', 'interino'),
('Dr. Carlos Ruiz', 'Avenida 5', '3101234567', 'Cali', 'Valle', '760001', '323456789', '987654323', '1003', 'sustituto'),
('Dr. Ana Martinez', 'Calle 12', '3201234567', 'Barranquilla', 'Atlántico', '080001', '423456789', '987654324', '1004', 'titular'),
('Dr. Luis Rodriguez', 'Carrera 7', '3301234567', 'Cartagena', 'Bolívar', '130001', '523456789', '987654325', '1005', 'sustituto');

INSERT INTO empleado (nombre, direccion, telefono, poblacion, provincia, codigo_postal, nif, seguridad_social, tipo_ats)
VALUES 
('Ana Torres', 'Calle 45', '3109876543', 'Bogotá', 'Bogotá', '110222', '623456789', '887654321', 'administrativos'),
('Pedro Ramirez', 'Carrera 89', '3209876543', 'Medellín', 'Antioquia', '050002', '723456789', '887654322', 'zona'),
('Lucia Fernandez', 'Avenida 78', '3309876543', 'Cali', 'Valle', '760002', '823456789', '887654323', 'auxiliares_enfermeria'),
('Jorge Suarez', 'Calle 90', '3409876543', 'Barranquilla', 'Atlántico', '080002', '923456789', '887654324', 'celadores'),
('Marta Lopez', 'Carrera 23', '3509876543', 'Cartagena', 'Bolívar', '130002', '123456780', '887654325', 'administrativos');

INSERT INTO paciente (id_medico, nombre, direccion, telefono, codigo_postal, nif, seguridad_social)
VALUES 
(1, 'Carlos Morales', 'Calle 33', '3012345678', '110333', '567890123', '111111111'),
(2, 'Maria Velasquez', 'Carrera 15', '3012345679', '050003', '667890123', '111111112'),
(3, 'Juanita Herrera', 'Avenida 22', '3012345680', '760003', '767890123', '111111113'),
(4, 'Andres Perez', 'Calle 66', '3012345681', '080003', '867890123', '111111114'),
(5, 'Laura Sanchez', 'Carrera 34', '3012345682', '130003', '967890123', '111111115');
	
INSERT INTO sustitucion (fechas_alta, fechas_baja, id_medico_temporal)
VALUES 
('2024-01-01', '2024-01-15', 1),
('2024-02-01', '2024-02-20', 2),
('2024-03-01', '2024-03-10', 4),
('2024-04-01', '2024-04-30', 5),
('2024-05-01', '2024-05-15', 1);

INSERT INTO vacaciones (id_profesional, tipo_profesional, fecha_inicio, fecha_fin)
VALUES 
(1, 'medico', '2024-01-01', '2024-01-10'),
(2, 'medico', '2024-02-01', '2024-02-15'),
(3, 'medico', '2024-03-01', '2024-03-10'),
(4, 'medico', '2024-04-01', '2024-04-15'),
(5, 'medico', '2024-05-01', '2024-05-10'),
(1, 'empleado', '2024-06-01', '2024-06-10'),
(2, 'empleado', '2024-07-01', '2024-07-15'),
(3, 'empleado', '2024-08-01', '2024-08-10'),
(4, 'empleado', '2024-09-01', '2024-09-15'),
(5, 'empleado', '2024-10-01', '2024-10-10');

INSERT INTO horario_consulta (id_medico, id_paciente, fecha, hora_inicio, hora_fin)
VALUES 
(1, 1, '2024-06-01', '08:00:00', '10:00:00'),
(2, 2, '2024-06-01', '10:00:00', '12:00:00'),
(3, 3, '2024-06-01', '14:00:00', '16:00:00'),
(4, 4, '2024-06-01', '16:00:00', '18:00:00'),
(5, 5, '2024-06-01', '18:00:00', '20:00:00'),
(1, 2, '2024-06-02', '08:00:00', '10:00:00'),
(2, 3, '2024-06-02', '10:00:00', '12:00:00'),
(3, 4, '2024-06-02', '14:00:00', '16:00:00'),
(4, 5, '2024-06-02', '16:00:00', '18:00:00'),
(5, 1, '2024-06-02', '18:00:00', '20:00:00');


-- Consultas 

-- ### 1. Número de pacientes atendidos por cada médico
SELECT m.nombre, COUNT(p.id) AS numero_pacientes
FROM medico m
JOIN paciente p ON m.id = p.id_medico
GROUP BY m.nombre;

-- ### 2. Total de días de vacaciones planificadas y disfrutadas por cada empleado

SELECT e.nombre, 
       SUM(DATEDIFF(v.fecha_fin, v.fecha_inicio)) AS dias_vacaciones
FROM empleado e
JOIN vacaciones v ON e.id = v.id_profesional
WHERE v.tipo_profesional = 'empleado'
GROUP BY e.nombre;

-- ### 3. Médicos con mayor cantidad de horas de consulta en la semana

SELECT m.nombre, 
       SUM(TIMESTAMPDIFF(HOUR, hc.hora_inicio, hc.hora_fin)) AS horas_consulta
FROM medico m
JOIN horario_consulta hc ON m.id = hc.id_medico
WHERE WEEK(hc.fecha) = WEEK(CURRENT_DATE)
GROUP BY m.nombre
ORDER BY horas_consulta DESC;


-- ### 4. Número de sustituciones realizadas por cada médico sustituto

SELECT m.nombre, COUNT(s.id) AS numero_sustituciones
FROM medico m
JOIN sustitucion s ON m.id = s.id_medico_temporal
GROUP BY m.nombre;


-- ### 5. Número de médicos que están actualmente en sustitución

SELECT COUNT(DISTINCT s.id_medico_temporal) AS numero_medicos_sustitutos
FROM sustitucion s
WHERE s.fechas_baja >= CURRENT_DATE;

-- ### 6. Horas totales de consulta por médico por día de la semana

SELECT m.nombre, 
       DAYNAME(hc.fecha) AS dia_semana, 
       SUM(TIMESTAMPDIFF(HOUR, hc.hora_inicio, hc.hora_fin)) AS horas_totales
FROM medico m
JOIN horario_consulta hc ON m.id = hc.id_medico
GROUP BY m.nombre, dia_semana;

-- ### 7. Médico con mayor cantidad de pacientes asignados

SELECT m.nombre, COUNT(p.id) AS numero_pacientes
FROM medico m
JOIN paciente p ON m.id = p.id_medico
GROUP BY m.nombre
ORDER BY numero_pacientes DESC
LIMIT 1;

-- ### 8. Empleados con más de 10 días de vacaciones disfrutadas

SELECT e.nombre, 
       SUM(DATEDIFF(v.fecha_fin, v.fecha_inicio)) AS dias_vacaciones
FROM empleado e
JOIN vacaciones v ON e.id = v.id_profesional
WHERE v.tipo_profesional = 'empleado'
GROUP BY e.nombre
HAVING dias_vacaciones > 10;

-- ### 9. Médicos que actualmente están realizando una sustitución

SELECT m.nombre
FROM medico m
JOIN sustitucion s ON m.id = s.id_medico_temporal
WHERE s.fechas_baja >= CURRENT_DATE;


-- ### 10. Promedio de horas de consulta por médico por día de la semana

SELECT m.nombre, 
       DAYNAME(hc.fecha) AS dia_semana, 
       AVG(TIMESTAMPDIFF(HOUR, hc.hora_inicio, hc.hora_fin)) AS horas_promedio
FROM medico m
JOIN horario_consulta hc ON m.id = hc.id_medico
GROUP BY m.nombre, dia_semana;


-- ### Desarrollado por Brayan Yesid Lindarte - ID. 10.XX.XXX.XXX -------