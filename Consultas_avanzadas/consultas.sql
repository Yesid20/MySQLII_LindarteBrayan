-- ##########################
-- ## Tarea - ###############
-- ##########################


-- Crear la base de datos 
CREATE DATABASE business;

-- Usar la base de datos 
USE business;

-- Creación de tabla departamento 

CREATE TABLE departamento (
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    presupuesto DOUBLE UNSIGNED NOT NULL, 
    gastos DOUBLE UNSIGNED NOT NULL
);
-- Creación de tabla empleado 

CREATE TABLE empleado (
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nif VARCHAR(9) NOT NULL UNIQUE, 
    nombre VARCHAR(100) NOT NULL,
    apellido1 VARCHAR(100) NOT NULL,
    apellido2 VARCHAR(100),
    id_departamento INT UNSIGNED,
    FOREIGN KEY (id_departamento) REFERENCES departamento(id)
);

-- Inserción de datos 

INSERT INTO departamento VALUES(1, 'Desarrollo', 120000, 6000);
INSERT INTO departamento VALUES(2, 'Sistemas', 150000, 21000);
INSERT INTO departamento VALUES(3, 'Recursos Humanos', 280000, 25000);
INSERT INTO departamento VALUES(4, 'Contabilidad', 110000, 3000);
INSERT INTO departamento VALUES(5, 'I+D', 375000, 380000);
INSERT INTO departamento VALUES(6, 'Proyectos', 0, 0);
INSERT INTO departamento VALUES(7, 'Publicidad', 0, 1000);
INSERT INTO empleado VALUES(1, '32481596F', 'Aarón', 'Rivero', 'Gómez', 1);
INSERT INTO empleado VALUES(2, 'Y5575632D', 'Adela', 'Salas', 'Díaz', 2);
INSERT INTO empleado VALUES(3, 'R6970642B', 'Adolfo', 'Rubio', 'Flores', 3);
INSERT INTO empleado VALUES(4, '77705545E', 'Adrián', 'Suárez', NULL, 4);
INSERT INTO empleado VALUES(5, '17087203C', 'Marcos', 'Loyola', 'Méndez', 5);
INSERT INTO empleado VALUES(6, '38382980M', 'María', 'Santana', 'Moreno', 1);
INSERT INTO empleado VALUES(7, '80576669X', 'Pilar', 'Ruiz', NULL, 2);
INSERT INTO empleado VALUES(8, '71651431Z', 'Pepe', 'Ruiz', 'Santana', 3);
INSERT INTO empleado VALUES(9, '56399183D', 'Juan', 'Gómez', 'López', 2);
INSERT INTO empleado VALUES(10, '46384486H', 'Diego','Flores', 'Salas', 5);
INSERT INTO empleado VALUES(11, '67389283A', 'Marta','Herrera', 'Gil', 1);
INSERT INTO empleado VALUES(12, '41234836R', 'Irene','Salas', 'Flores', NULL);
INSERT INTO empleado VALUES(13, '82635162B', 'Juan Antonio','Sáez', 'Guerrero',
NULL);

-- Consultas Avanzadas (Función, procedimiento o sets)

-- Lista el primer apellido de todos los empleados. (función)

DELIMITER //

CREATE PROCEDURE listar_apellido1_empleados()
BEGIN
    SELECT apellido1 FROM empleado;
END //

DELIMITER ;

-- Llamado del procedimiento 

CALL listar_apellido1_empleados();

-- Lista el primer apellido de los empleados eliminando los apellidos que estén
-- repetidos.

DELIMITER // 

CREATE PROCEDURE listar_apellido1_unique()
BEGIN 
	SELECT DISTINCT apellido1 FROM empleado;
END //

DELIMITER ; 

-- Llamado del procedimiento 

CALL listar_apellido1_unique();

-- Lista todas las columnas de la tabla empleado.

DELIMITER //

CREATE PROCEDURE listar_all_empleados()
BEGIN 
	SELECT * FROM empleado;
END //

DELIMITER ;

-- Llamado del procedimiento 

CALL listar_all_empleados();

-- Lista el nombre y los apellidos de todos los empleados.

DELIMITER //

CREATE PROCEDURE lista_names_apellidos_employed()
BEGIN 
	SELECT nombre, apellido1, apellido2 FROM empleado;
END //

DELIMITER ;

-- Llamado del procedimiento 

CALL lista_names_apellidos_employed(); 

-- Lista el identificador de los departamentos de los empleados que aparecen
-- en la tabla empleado.

DELIMITER //

CREATE PROCEDURE listar_departamentos_employeds()
BEGIN 
	SELECT DISTINCT id_departamento FROM empleado WHERE id_departamento IS NOT NULL;
END //

DELIMITER ; 

-- Llamado del procedimiento 
CALL listar_departamentos_employeds();

-- Lista el identificador de los departamentos de los empleados que aparecen
-- en la tabla empleado, eliminando los identificadores que aparecen repetidos.

DELIMITER //

CREATE PROCEDURE listar_departamentos_unicos()
BEGIN
	SELECT DISTINCT id_departamento FROM empleado WHERE id_departamento IS NOT NULL;
END //

DELIMITER ; 

-- Llamado del procedimiento 

CALL listar_departamentos_unicos();

-- Lista el nombre y apellidos de los empleados en una única columna. 

DELIMITER //

CREATE PROCEDURE listar_nombre_apellidos_onecolumn()
BEGIN 
	SELECT CONCAT(nombre, ' ', apellido1, ' ', IFNULL(apellido2, '')) AS full_name FROM empleado;
END //

DELIMITER ;

-- Llamado del procedimiento 

CALL listar_nombre_apellidos_onecolumn();

-- Lista el nombre y apellidos de los empleados en una única columna,
-- convirtiendo todos los caracteres en mayúscula.

DELIMITER //

CREATE PROCEDURE listar_nombre_apellidos_mayus()
BEGIN 
	SELECT UPPER(CONCAT(nombre, ' ', apellido1, ' ', IFNULL(apellido2, ''))) AS full_name_mayus FROM empleado;
END //

DELIMITER ;

-- Llamado del procedimiento 

CALL listar_nombre_apellidos_mayus();

-- Lista el nombre y apellidos de los empleados en una única columna,
-- convirtiendo todos los caracteres en minúscula.

DELIMITER //

CREATE PROCEDURE listar_nombre_apellidos_minus()
BEGIN 
	SELECT LOWER(CONCAT(nombre, ' ', apellido1, ' ', IFNULL(apellido2, ''))) AS full_name_minus FROM empleado;
END //

DELIMITER ;

-- Llamado del procedimiento 

CALL listar_nombre_apellidos_minus();

-- Lista el identificador de los empleados junto al nif, pero el nif deberá
-- aparecer en dos columnas, una mostrará únicamente los dígitos del nif y la
-- otra la letra.

DELIMITER //

CREATE PROCEDURE listar_id_nif_separado()
BEGIN 
	SELECT id,
			SUBSTRING(nif, 1, LENGTH(nif) - 1)AS nif_digit,
            RIGHT(nif, 1) AS nif_letter
	FROM empleado;
END // 

DELIMITER ;

-- Llamado del procedimiento 

CALL listar_id_nif_separado(); 

-- Lista el nombre de cada departamento y el valor del presupuesto actual del
-- que dispone. Para calcular este dato tendrá que restar al valor del
-- presupuesto inicial (columna presupuesto) los gastos que se han generado
-- (columna gastos). Tenga en cuenta que en algunos casos pueden existir
-- valores negativos. Utilice un alias apropiado para la nueva columna columna
-- que está calculando.

DELIMITER //
CREATE FUNCTION calcular_presupuesto_actual(presupuesto DOUBLE, gastos DOUBLE)
RETURNS DOUBLE
DETERMINISTIC 
BEGIN 
	RETURN presupuesto - gastos;
END // 

DELIMITER ; 

-- Llamado de la función 

SELECT nombre, 
		calcular_presupuesto_actual(presupuesto, gastos) AS presupuesto_actual
FROM departamento;


-- Lista el nombre de los departamentos y el valor del presupuesto actual
-- ordenado de forma ascendente.

-- Llamado del procedimiento 

SELECT nombre, 
		calcular_presupuesto_actual(presupuesto, gastos) AS presupuesto_actual
FROM departamento
ORDER BY presupuesto_actual ASC;

-- Lista el nombre de todos los departamentos ordenados de forma
-- ascendente.

DELIMITER //

CREATE PROCEDURE listar_departamentos_asc()
BEGIN 
	SELECT nombre
    FROM departamento
	ORDER BY nombre ASC;
END //

DELIMITER ;

-- Llamado del procedimiento 

CALL listar_departamentos_asc();

-- Lista el nombre de todos los departamentos ordenados de forma
-- descendente.

DELIMITER //

CREATE PROCEDURE listar_departamentos_desc()
BEGIN 
	SELECT nombre 
	FROM departamento 
	ORDER BY nombre DESC;
END //

DELIMITER ;

-- Llamado del procedimiento 

CALL listar_departamentos_desc();

-- Lista los apellidos y el nombre de todos los empleados, ordenados de forma
-- alfabética tendiendo en cuenta en primer lugar sus apellidos y luego su
-- nombre.

DELIMITER //

CREATE PROCEDURE lista_empleados_orde()
BEGIN
	SELECT apellido1, apellido2, nombre
    FROM empleado
    ORDER BY apellido1, apellido2, nombre;
END //

DELIMITER ;

-- Llamado del procedimiento 

CALL lista_empleados_orde();

-- Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos que tienen mayor presupuesto.  

DELIMITER //

CREATE PROCEDURE top3_departamentos_mayor_presupuesto()
BEGIN
    SELECT nombre, presupuesto
    FROM departamento
    ORDER BY presupuesto DESC
    LIMIT 3;
END //

DELIMITER ;

-- Llamado del procedimiento 

CALL top3_departamentos_mayor_presupuesto();

-- Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos que tienen menor presupuesto.

DELIMITER //

CREATE PROCEDURE top3_departamentos_menor_presupuesto()
BEGIN
    SELECT nombre, presupuesto
    FROM departamento
    ORDER BY presupuesto ASC
    LIMIT 3;
END //

DELIMITER ;

-- Llamado del procedimiento 

CALL top3_departamentos_menor_presupuesto();
 
-- Devuelve una lista con el nombre y el gasto, de los 2 departamentos que tienen mayor gasto.

DELIMITER //

CREATE PROCEDURE top2_departamentos_mayor_gasto()
BEGIN
    SELECT nombre, gastos
    FROM departamento
    ORDER BY gastos DESC
    LIMIT 2;
END //

DELIMITER ;

-- Llamado del procedimiento 

CALL top2_departamentos_mayor_gasto();

-- Devuelve una lista con el nombre y el gasto, de los 2 departamentos que tienen menor gasto.

DELIMITER //

CREATE PROCEDURE top2_departamentos_menor_gasto()
BEGIN
    SELECT nombre, gastos
    FROM departamento
    ORDER BY gastos ASC
    LIMIT 2;
END //

DELIMITER ;

-- Llamado del procedimiento 

CALL top2_departamentos_menor_gasto();
 
-- Devuelve una lista con 5 filas a partir de la tercera fila de la tabla empleado. La
-- tercera fila se debe incluir en la respuesta. La respuesta debe incluir todas las columnas de la tabla empleado.

DELIMITER //

CREATE PROCEDURE lista_empleados_desde_tercera()
BEGIN
    SELECT *
    FROM empleado
    LIMIT 2, 5;
END //

DELIMITER ;

-- Llamado del procedimiento 

CALL lista_empleados_desde_tercera();DELIMITER //
 
-- Devuelve una lista con el nombre de los departamentos y el presupuesto, de
-- aquellos que tienen un presupuesto mayor o igual a 150000 euros.

DELIMITER //

CREATE PROCEDURE departamentos_presupuesto_mayor_igual_150000()
BEGIN
    SELECT nombre, presupuesto
    FROM departamento
    WHERE presupuesto >= 150000;
END //

DELIMITER ;

-- Llamado del procedimiento 

CALL departamentos_presupuesto_mayor_igual_150000();

-- Devuelve una lista con el nombre de los departamentos y el gasto, de aquellos que tienen menos de 5000 euros de gastos.

DELIMITER //

CREATE PROCEDURE departamentos_gasto_menor_5000()
BEGIN
    SELECT nombre, gastos
    FROM departamento
    WHERE gastos < 5000;
END //

DELIMITER ;

-- Llamado del procedimiento 

CALL departamentos_gasto_menor_5000();
  
-- Devuelve una lista con el nombre de los departamentos y el presupuesto, de
-- aquellos que tienen un presupuesto entre 100000 y 200000 euros. Sin utilizar el operador BETWEEN.

DELIMITER //

CREATE PROCEDURE departamentos_presupuesto_entre_100000_y_200000()
BEGIN
    SELECT nombre, presupuesto
    FROM departamento
    WHERE presupuesto >= 100000 AND presupuesto <= 200000;
END //

DELIMITER ;

-- Llamado del procedimiento 

CALL departamentos_presupuesto_entre_100000_y_200000();

-- Devuelve una lista con el nombre de los departamentos que no tienen un
-- presupuesto entre 100000 y 200000 euros. Sin utilizar el operador BETWEEN.

DELIMITER //

CREATE PROCEDURE departamentos_presupuesto_fuera_100000_y_200000()
BEGIN
    SELECT nombre
    FROM departamento
    WHERE presupuesto < 100000 OR presupuesto > 200000;
END //

DELIMITER ;

-- Llamado del procedimiento 

CALL departamentos_presupuesto_fuera_100000_y_200000();
 
-- Devuelve una lista con el nombre de los departamentos que tienen un
-- presupuesto entre 100000 y 200000 euros. Utilizando el operador BETWEEN.

DELIMITER //

CREATE PROCEDURE departamentos_presupuesto_entre_100000_y_200000_between()
BEGIN
    SELECT nombre, presupuesto
    FROM departamento
    WHERE presupuesto BETWEEN 100000 AND 200000;
END //

DELIMITER ;

-- Llamado del procedimiento 

CALL departamentos_presupuesto_entre_100000_y_200000_between();
 
-- Devuelve una lista con el nombre de los departamentos que no tienen un
-- presupuesto entre 100000 y 200000 euros. Utilizando el operador BETWEEN.

DELIMITER //

CREATE PROCEDURE departamentos_presupuesto_fuera_100000_y_200000_between()
BEGIN
    SELECT nombre
    FROM departamento
    WHERE presupuesto NOT BETWEEN 100000 AND 200000;
END //

DELIMITER ;

-- Llamado del procedimiento 

CALL departamentos_presupuesto_fuera_100000_y_200000_between();
 
-- Devuelve una lista con el nombre de los departamentos, gastos y
-- presupuesto, de aquellos departamentos donde los gastos sean mayores que el presupuesto del que disponen.

DELIMITER //

CREATE PROCEDURE departamentos_gastos_mayores_que_presupuesto()
BEGIN
    SELECT nombre, gastos, presupuesto
    FROM departamento
    WHERE gastos > presupuesto;
END //

DELIMITER ;

-- Llamado del procedimiento 

CALL departamentos_gastos_mayores_que_presupuesto();
 
-- Devuelve una lista con el nombre de los departamentos, gastos y
-- presupuesto, de aquellos departamentos donde los gastos sean menores que el presupuesto del que disponen.

DELIMITER //

CREATE PROCEDURE departamentos_gastos_menores_que_presupuesto()
BEGIN
    SELECT nombre, gastos, presupuesto
    FROM departamento
    WHERE gastos < presupuesto;
END //

DELIMITER ;

-- Llamado del procedimiento 

CALL departamentos_gastos_menores_que_presupuesto();


-- Devuelve una lista con el nombre de los departamentos, gastos y
-- presupuesto, de aquellos departamentos donde los gastos sean iguales al
-- presupuesto del que disponen.

DELIMITER //

CREATE FUNCTION departameto_gastos_iguales_presupuesto()
RETURNS VARCHAR(100) 
DETERMINISTIC
BEGIN
    DECLARE nombre_departamento VARCHAR(100);
    SELECT nombre INTO nombre_departamento FROM departamento
    WHERE presupuesto = gastos;
    RETURN nombre_departamento;
END //

DELIMITER ;

-- Llamado de funcion

SELECT departameto_gastos_iguales_presupuesto();

-- Lista todos los datos de los empleados cuyo segundo apellido sea NULL.

DELIMITER //

CREATE PROCEDURE empleado_segundo_apellido_null()
BEGIN
    SELECT *
    FROM empleado
    WHERE apellido2 IS NULL;
END //

DELIMITER ;

-- Llamado del procedimiento

CALL empleado_segundo_apellido_null();

-- Lista todos los datos de los empleados cuyo segundo apellido no sea NULL.

DELIMITER //

CREATE PROCEDURE empleado_segundo_apellido_no_null()
BEGIN
    SELECT *
    FROM empleado
    WHERE apellido2 IS NOT NULL;
END //

DELIMITER ;

-- Llamado del procedimiento 

CALL empleado_segundo_apellido_no_null();

-- Lista todos los datos de los empleados cuyo segundo apellido sea López.

DELIMITER //

CREATE PROCEDURE empleado_segundo_apellido_Lopez()
BEGIN
    SELECT *
    FROM empleado
    WHERE apellido2 = 'López';
END //

DELIMITER ;

-- Llamado del procedimiento 

CALL empleado_segundo_apellido_Lopez();

-- Lista todos los datos de los empleados cuyo segundo apellido
-- sea Díaz o Moreno. Sin utilizar el operador IN.

DELIMITER //

CREATE PROCEDURE empleado_segundo_apellido_Díaz_o_Moreno()
BEGIN
    SELECT *
    FROM empleado
    WHERE apellido2 = 'Díaz' OR apellido2 = 'Moreno';
END //

DELIMITER ;

-- Llamado del procedimiento 

CALL empleado_segundo_apellido_Díaz_o_Moreno();

-- Lista todos los datos de los empleados cuyo segundo apellido
-- sea Díaz o Moreno. Utilizando el operador IN.

DELIMITER //

CREATE PROCEDURE empleado_segundo_apellido_Díaz_o_Moreno_in()
BEGIN 
    SELECT *
    FROM empleado
    WHERE apellido2 IN ('Díaz', 'Moreno');
END //

DELIMITER ;

-- Llamado del procedimiento 

CALL empleado_segundo_apellido_Díaz_o_Moreno_in();

-- Lista los nombres, apellidos y nif de los empleados que trabajan en el
-- departamento 3.

DELIMITER //

CREATE PROCEDURE empleadosEnDepartamento3()
BEGIN
    SELECT nombre, apellido1, apellido2, nif
    FROM empleado
    WHERE id_departamento = 3;
END //
DELIMITER ;

-- Llamado del procedimiento 

CALL empleadosEnDepartamento3();

-- Lista los nombres, apellidos y nif de los empleados que trabajan en los
-- departamentos 2, 4 o 5.

DELIMITER //

CREATE PROCEDURE empleadosEnDepartamento245()
BEGIN
    SELECT nombre, apellido1, apellido2, nif
    FROM empleado
    WHERE id_departamento IN (2,4,5);
END //
DELIMITER ;

-- Llamado del procedimiento

CALL empleadosEnDepartamento245();


-- Consultas multitabla Composición interna

-- Devuelve un listado con los empleados y los datos de los departamentos
-- donde trabaja cada uno.

DELIMITER //

CREATE PROCEDURE listaEmpleadoDepartamento()
BEGIN
    SELECT e.id AS idEmpleado, e.nif, e.nombre AS nombreEmpleado, e.apellido1, e.apellido2, d.id AS idDepartamento, d.nombre AS NombreDepartamento, d.presupuesto, d.gastos
    FROM empleado e
    INNER JOIN departamento d ON e.id_departamento = d.id;
END //

DELIMITER ;

-- Llamado del procedimiento 

CALL listaEmpleadoDepartamento();

-- Devuelve un listado con los empleados y los datos de los departamentos
-- donde trabaja cada uno.

DELIMITER //

CREATE PROCEDURE listarEmpleadosConDepartamentosOrdenado()
BEGIN
    SELECT e.nombre AS nombre_empleado, e.apellido1, e.apellido2, e.nif, d.nombre AS nombre_departamento, d.presupuesto, d.gastos
    FROM empleado e
    INNER JOIN departamento d ON e.id_departamento = d.id
    ORDER BY d.nombre ASC, e.apellido1 ASC, e.apellido2 ASC, e.nombre ASC;
END //
DELIMITER ;

-- Llamado del procedimiento

CALL listarEmpleadosConDepartamentosOrdenado();

-- Devuelve un listado con el identificador y el nombre del departamento,
-- solamente de aquellos departamentos que tienen empleados.

DELIMITER //

CREATE PROCEDURE identificadorNombreDepartamentos()
BEGIN
    SELECT d.id AS identificador, d.nombre AS NombreDepartamento
    FROM departamento d
    INNER JOIN empleado e ON d.id = e.id_departamento;
END //

DELIMITER ;

-- Llamado del procedimiento 

CALL identificadorNombreDepartamentos();

-- Devuelve un listado con el identificador, el nombre del departamento y el
-- valor del presupuesto actual del que dispone, solamente de aquellos
-- departamentos que tienen empleados.

DELIMITER //

CREATE PROCEDURE listarDepartamentosConPresupuestoActual()
BEGIN
    SELECT d.id AS idDepartamento, d.nombre AS NombreDepartamento, (d.presupuesto - d.gastos) AS presupuestoActual
    FROM departamento d
    INNER JOIN empleado e ON d.id = e.id_departamento
    GROUP BY d.id;
END //

DELIMITER ;

-- Llamado del procedimiento

CALL listarDepartamentosConPresupuestoActual();

-- Devuelve el nombre del departamento donde trabaja el empleado que tiene
-- el nif 38382980M.

DELIMITER //
CREATE PROCEDURE empleado_con_nif_38382980M()
BEGIN
    SELECT d.nombre AS NombreDepartamento
    FROM departamento d
    INNER JOIN  empleado e ON d.id = e.id_departamento
    WHERE e.nif = '38382980M';
END //

DELIMITER ;

-- Llamado del procedimiento 

CALL empleado_con_nif_38382980M();

-- Devuelve el nombre del departamento donde trabaja el empleado 
-- Pepe Ruiz Santana.

DELIMITER //

CREATE FUNCTION obtener_departamento_pepe_ruiz_santana()
RETURNS VARCHAR(100)
BEGIN
    DECLARE depto_nombre VARCHAR(100);
    SELECT d.nombre INTO depto_nombre
    FROM empleado e
    JOIN departamento d ON e.id_departamento = d.id
    WHERE e.nombre = 'Pepe' AND e.apellido1 = 'Ruiz' AND e.apellido2 = 'Santana';
    RETURN depto_nombre;
END //

DELIMITER ;

-- Llamado a la función 

SELECT obtener_departamento_pepe_ruiz_santana() AS departamento_pepe_ruiz_santana;

-- Devuelve un listado con los datos de los empleados que trabajan en el
-- departamento de I+D. Ordena el resultado alfabéticamente.

DELIMITER //

CREATE PROCEDURE listar_empleados_id()
BEGIN
    SELECT e.*
    FROM empleado e
    JOIN departamento d ON e.id_departamento = d.id
    WHERE d.nombre = 'I+D'
    ORDER BY e.nombre, e.apellido1, e.apellido2;
END //

DELIMITER ;

-- Llamado al procedimiento 

CALL listar_empleados_id();

-- Devuelve un listado con los datos de los empleados que trabajan en el
-- departamento de Sistemas, Contabilidad o I+D. Ordena el resultado
-- alfabéticamente.

DELIMITER //

CREATE PROCEDURE listar_empleados_departamentos_especificos()
BEGIN
    SELECT e.*
    FROM empleado e
    JOIN departamento d ON e.id_departamento = d.id
    WHERE d.nombre IN ('Sistemas', 'Contabilidad', 'I+D')
    ORDER BY e.nombre, e.apellido1, e.apellido2;
END //

DELIMITER ;

-- Llamado al procedimiento 

CALL listar_empleados_departamentos_especificos();

-- Devuelve una lista con el nombre de los empleados que tienen los
-- departamentos que no tienen un presupuesto entre 100000 y 200000 euros.

DELIMITER //

CREATE PROCEDURE listar_empleados_departamentos_presupuesto_no_rango()
BEGIN
    SELECT e.nombre, e.apellido1, e.apellido2
    FROM empleado e
    JOIN departamento d ON e.id_departamento = d.id
    WHERE d.presupuesto NOT BETWEEN 100000 AND 200000;
END //

DELIMITER ;

-- Llamado al procedimiento 

CALL listar_empleados_departamentos_presupuesto_no_rango();

-- Devuelve un listado con el nombre de los departamentos donde existe
-- algún empleado cuyo segundo apellido sea NULL. Tenga en cuenta que no
-- debe mostrar nombres de departamentos que estén repetidos.

DELIMITER //

CREATE PROCEDURE listar_departamentos_empleados_sin_apellido2()
BEGIN
    SELECT DISTINCT d.nombre
    FROM departamento d
    JOIN empleado e ON d.id = e.id_departamento
    WHERE e.apellido2 IS NULL;
END //

DELIMITER ;

-- Llamado al procedimiento 

CALL listar_departamentos_empleados_sin_apellido2();


-- Consultas multitabla Composición externa

-- Devuelve un listado con todos los empleados junto con los datos de los
-- departamentos donde trabajan. Este listado también debe incluir los
-- empleados que no tienen ningún departamento asociado.

DELIMITER //

CREATE PROCEDURE listar_empleados_departamentos()
BEGIN
    SELECT e.*, d.nombre AS nombre_departamento, d.presupuesto, d.gastos
    FROM empleado e
    LEFT JOIN departamento d ON e.id_departamento = d.id;
END //

DELIMITER ;

-- Llamado al procedimiento 

CALL listar_empleados_departamentos();

-- Devuelve un listado donde sólo aparezcan aquellos empleados que no
-- tienen ningún departamento asociado.

DELIMITER //

CREATE PROCEDURE listar_empleados_sin_departamento()
BEGIN
    SELECT e.*
    FROM empleado e
    LEFT JOIN departamento d ON e.id_departamento = d.id
    WHERE d.id IS NULL;
END //

DELIMITER ;

-- Llamado al procedimiento 

CALL listar_empleados_sin_departamento();

-- Devuelve un listado donde sólo aparezcan aquellos departamentos que no
-- tienen ningún empleado asociado.

DELIMITER //

CREATE PROCEDURE listar_departamentos_sin_empleados()
BEGIN
    SELECT d.*
    FROM departamento d
    LEFT JOIN empleado e ON d.id = e.id_departamento
    WHERE e.id IS NULL;
END //

DELIMITER ;

-- Llamado al procedimiento

CALL listar_departamentos_sin_empleados();

-- Devuelve un listado con todos los empleados junto con los datos de los
-- departamentos donde trabajan. El listado debe incluir los empleados que no
-- tienen ningún departamento asociado y los departamentos que no tienen
-- ningún empleado asociado. Ordene el listado alfabéticamente por el
-- nombre del departamento.

DELIMITER //

CREATE PROCEDURE listar_empleados_departamentos_completo()
BEGIN
    SELECT e.*, d.nombre AS nombre_departamento, d.presupuesto, d.gastos
    FROM empleado e
    LEFT JOIN departamento d ON e.id_departamento = d.id
    UNION
    SELECT e.*, d.nombre AS nombre_departamento, d.presupuesto, d.gastos
    FROM empleado e
    RIGHT JOIN departamento d ON e.id_departamento = d.id
    ORDER BY nombre_departamento;
END //

DELIMITER ;

-- Llamado al procedimiento 

CALL listar_empleados_departamentos_completo();

-- Devuelve un listado con los empleados que no tienen ningún departamento
-- asociado y los departamentos que no tienen ningún empleado asociado.
-- Ordene el listado alfabéticamente por el nombre del departamento.

DELIMITER //

CREATE PROCEDURE listar_empleados_departamentos_no_asociados()
BEGIN
    SELECT e.*, d.nombre AS nombre_departamento, d.presupuesto, d.gastos
    FROM empleado e
    LEFT JOIN departamento d ON e.id_departamento = d.id
    WHERE d.id IS NULL
    UNION
    SELECT e.*, d.nombre AS nombre_departamento, d.presupuesto, d.gastos
    FROM empleado e
    RIGHT JOIN departamento d ON e.id_departamento = d.id
    WHERE e.id IS NULL
    ORDER BY nombre_departamento;
END //

DELIMITER ;

-- Llamado al procedimiento 

CALL listar_empleados_departamentos_no_asociados();

-- Consultas Resumen 

-- Calcula la suma del presupuesto de todos los departamentos.

DELIMITER //

CREATE FUNCTION suma_presupuesto()
RETURNS DOUBLE 
DETERMINISTIC
BEGIN
	DECLARE suma_total DOUBLE;
	SELECT SUM(presupuesto) INTO suma_total FROM departamento;
	RETURN suma_total;
END //

delimiter ;

-- Llamado de la function 

select suma_presupuesto() as suma_presupuesto;

-- Calcula la media del presupuesto de todos los departamentos.

DELIMITER //

CREATE FUNCTION media_presupuesto()
RETURNS double 
DETERMINISTIC
BEGIN
	DECLARE presupuesto_media DOUBLE;
	SELECT AVG(presupuesto) INTO presupuesto_media FROM departamento;
	RETURN presupuesto_media;
END //

DELIMITER ;

-- Llamado de la function

SELECT media_presupuesto() AS media_presupuesto;

-- Calcula el valor mínimo del presupuesto de todos los departamentos.

DELIMITER //

CREATE FUNCTION minimo_presupuesto()
RETURNS DOUBLE 
DETERMINISTIC
BEGIN
	DECLARE presupuesto_min DOUBLE;
	SELECT MIN(presupuesto) INTO presupuesto_min FROM departamento;
	RETURN presupuesto_min;
END //

DELIMITER ;

-- Llamado de la function 

SELECT minimo_presupuesto() AS minimo_presupuesto;

-- Calcula el nombre del departamento y el presupuesto que tiene asignado,
-- del departamento con menor presupuesto.

DELIMITER //

CREATE FUNCTION minimo_presupuesto_nombre()
RETURNS VARCHAR(100) 
DETERMINISTIC
BEGIN
    DECLARE min_presupuesto INT;
    DECLARE depto_nombre VARCHAR(50);
    DECLARE resultado VARCHAR(100);
    SELECT MIN(presupuesto) INTO min_presupuesto FROM departamento;
    SELECT nombre INTO depto_nombre FROM departamento WHERE presupuesto = min_presupuesto LIMIT 1;
    SET resultado = CONCAT('Nombre: ', depto_nombre, ', Presupuesto: ', min_presupuesto);
    RETURN resultado;
END //

DELIMITER ;

-- Llamado de la function 

SELECT minimo_presupuesto_nombre() AS resultado;

-- Calcula el valor máximo del presupuesto de todos los departamentos.

DELIMITER //

CREATE FUNCTION maximo_presupuesto()
RETURNS DOUBLE 
DETERMINISTIC
BEGIN
	DECLARE presupuesto_max DOUBLE;
	SELECT MAX(presupuesto) INTO presupuesto_max FROM departamento;
	RETURN presupuesto_max;
END //

DELIMITER ;

-- Llamado de la function 

SELECT maximo_presupuesto() AS maximo_presupuesto;

-- Calcula el nombre del departamento y el presupuesto que tiene asignado,
-- del departamento con mayor presupuesto.

DELIMITER //

CREATE PROCEDURE maximo_presupuesto()
BEGIN
    DECLARE max_presupuesto INT;
    SELECT MAX(presupuesto) INTO max_presupuesto FROM departamento;
    SELECT nombre, presupuesto
    FROM departamento
    WHERE presupuesto = max_presupuesto;
END //

DELIMITER ;

-- Llamado del procedimiento 

CALL maximo_presupuesto();

-- Calcula el número total de empleados que hay en la tabla empleado.

DELIMITER //

CREATE PROCEDURE numero_empleados()
BEGIN
	SELECT COUNT(id) FROM empleado;
END //

DELIMITER ;

-- Llamado del procedimiento 

CALL numero_empleados();

-- Calcula el número de empleados que no tienen NULL en su segundo
-- apellido.

DELIMITER //

CREATE PROCEDURE empleados_no_null()
BEGIN
	SELECT COUNT(id) FROM empleado WHERE apellido2 IS NOT NULL;
END //

DELIMITER  ;

-- Prueba with DROP 

DROP PROCEDURE empleados_no_null;

-- Llamado del procedimiento 

CALL empleados_no_null();

-- Calcula el número de empleados que hay en cada departamento. Tienes que
-- devolver dos columnas, una con el nombre del departamento y otra con el
-- número de empleados que tiene asignados.

DELIMITER //

CREATE PROCEDURE nombre_numero_depto()
BEGIN
	SELECT departamento.nombre, COUNT(empleado.id) FROM departamento INNER JOIN empleado ON departamento.id = empleado.id_departamento GROUP BY departamento.nombre;
END //

DELIMITER ;

-- Llamado del procedimiento 

CALL nombre_numero_depto();

-- Calcula el nombre de los departamentos que tienen más de 2 empleados. El
-- resultado debe tener dos columnas, una con el nombre del departamento y
-- otra con el número de empleados que tiene asignados.

DELIMITER //

CREATE PROCEDURE depto_2()
BEGIN 
	SELECT departamento.nombre, COUNT(empleado.id) FROM departamento INNER JOIN empleado ON departamento.id = empleado.id_departamento GROUP BY departamento.nombre HAVING COUNT(empleado.id)>2;	
END //

DELIMITER ;

DROP PROCEDURE depto_2;

-- Llamado del procedimiento 

CALL depto_2();

-- Calcula el número de empleados que trabajan en cada uno de los
-- departamentos. El resultado de esta consulta también tiene que incluir
-- aquellos departamentos que no tienen ningún empleado asociado.

DELIMITER //

CREATE PROCEDURE nombre_numero_depto_todos()
BEGIN
	SELECT departamento.nombre, COUNT(empleado.id) FROM departamento LEFT JOIN empleado ON departamento.id = empleado.id_departamento GROUP BY departamento.nombre;
END //

DELIMITER ;

-- Llamado del procedimiento 

call nombre_numero_depto_todos();

-- Calcula el número de empleados que trabajan en cada unos de los
-- departamentos que tienen un presupuesto mayor a 200000 euros.

DELIMITER //

CREATE PROCEDURE depto_mayor()
BEGIN
	SELECT departamento.nombre,departamento.presupuesto, COUNT(empleado.id) FROM departamento LEFT JOIN empleado ON departamento.id = empleado.id_departamento WHERE departamento.presupuesto>200000 GROUP BY departamento.nombre, departamento.presupuesto;	
END //

DELIMITER ;

-- Llamado del procedimiento 

CALL depto_mayor();


-- ###### DESARROLLADO POR BRAYAN YESID LINDARTE ANAYA -- ID 10.XX.XXX.XXX #### --

