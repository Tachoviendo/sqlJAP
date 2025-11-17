-- 1. Obtener los apellidos de los empleados.
SELECT Apellidos 
FROM EMPLEADOS;

-- 2. Obtener los apellidos de los empleados sin repeticiones.
SELECT DISTINCT Apellidos 
FROM EMPLEADOS;

-- 3. Obtener todos los datos de los empleados que se apellidan 'López'.
SELECT * 
FROM EMPLEADOS 
WHERE Apellidos = 'López';

-- 4. Obtener todos los datos de los empleados que se apellidan 'López' o 'Pérez'.
SELECT * 
FROM EMPLEADOS 
WHERE Apellidos = 'López' OR Apellidos = 'Pérez';

-- 5. Obtener todos los datos de los empleados que trabajan para el departamento 14.
SELECT * 
FROM EMPLEADOS 
WHERE Departamento = 14;

-- 6. Obtener todos los datos de los empleados que trabajan para el departamento 37 y para el departamento 77.
SELECT * 
FROM EMPLEADOS 
WHERE Departamento = 37 OR Departamento = 77;

-- 7. Obtener todos los datos de los empleados cuyo apellido comience por 'P'.
SELECT * 
FROM EMPLEADOS 
WHERE Apellidos LIKE 'P%';

-- 8. Obtener el presupuesto total de todos los departamentos.
SELECT SUM(Presupuesto) AS PresupuestoTotal 
FROM DEPARTAMENTOS;

-- 9. Obtener el número de empleados en cada departamento.
SELECT Departamento, COUNT(*) AS NumeroEmpleados 
FROM EMPLEADOS 
GROUP BY Departamento;

-- 10. Obtener un listado completo de empleados, incluyendo por cada empleado los datos del empleado y de su departamento.
SELECT E.*, D.* 
FROM EMPLEADOS E 
INNER JOIN DEPARTAMENTOS D ON E.Departamento = D.Codigo;

-- 11. Obtener un listado completo de empleados, incluyendo el nombre y apellidos del empleado junto al nombre y presupuesto de su departamento.
SELECT E.Nombre, E.Apellidos, D.Nombre AS NombreDepartamento, D.Presupuesto 
FROM EMPLEADOS E 
INNER JOIN DEPARTAMENTOS D ON E.Departamento = D.Codigo;

-- 12. Obtener los nombres y apellidos de los empleados que trabajan en departamentos cuyo presupuesto sea mayor de $60.000
SELECT E.Nombre, E.Apellidos 
FROM EMPLEADOS E 
INNER JOIN DEPARTAMENTOS D ON E.Departamento = D.Codigo 
WHERE D.Presupuesto > 60000;

-- 13. Obtener los datos de los departamentos cuyo presupuesto es superior al presupuesto medio de todos los departamentos.
SELECT * 
FROM DEPARTAMENTOS 
WHERE Presupuesto > (SELECT AVG(Presupuesto) FROM DEPARTAMENTOS);

-- 14. Obtener los nombres (únicamente los nombres) de los departamentos que tienen más de dos empleados.
SELECT D.Nombre 
FROM DEPARTAMENTOS D 
INNER JOIN EMPLEADOS E ON D.Codigo = E.Departamento 
GROUP BY D.Nombre 
HAVING COUNT(*) > 2;

-- 15. Añadir un nuevo departamento: 'Calidad', con presupuesto de $40.000 y código 11. Añadir un empleado vinculado al departamento recién creado: Esther Vázquez, DNI: 89267109.
INSERT INTO DEPARTAMENTOS (Codigo, Nombre, Presupuesto) 
VALUES (11, 'Calidad', 40000);

INSERT INTO EMPLEADOS (DNI, Nombre, Apellidos, Departamento) 
VALUES ('89267109', 'Esther', 'Vázquez', 11);

-- 16. Aplicar un recorte presupuestario del 10% a todos los departamentos.
UPDATE DEPARTAMENTOS 
SET Presupuesto = Presupuesto * 0.9;

-- 17. Reasignar a los empleados del departamento de investigación (código 77) al departamento de informática (código 14).
UPDATE EMPLEADOS 
SET Departamento = 14 
WHERE Departamento = 77;

-- 18. Despedir a todos los empleados que trabajan para el departamento de informática (código 14).
DELETE FROM EMPLEADOS 
WHERE Departamento = 14;

-- 19. Despedir a todos los empleados que trabajan para departamentos cuyo presupuesto sea superior a los $60.000.
DELETE FROM EMPLEADOS 
WHERE Departamento IN (
    SELECT Codigo 
    FROM DEPARTAMENTOS 
    WHERE Presupuesto > 60000
);
