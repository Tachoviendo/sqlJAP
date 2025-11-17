-- 1. Sacar una relación completa de los científicos asignados a cada proyecto. Mostrar DNI, nombre del científico, identificador del proyecto y nombre del proyecto.
SELECT C.DNI, C.NomApels, P.Id, P.Nombre 
FROM CIENTIFICOS C 
INNER JOIN ASIGNADO_A A ON C.DNI = A.Cientifico 
INNER JOIN PROYECTO P ON A.Proyecto = P.Id;

-- 2. Obtener el número de proyectos al que está asignado cada científico 
SELECT C.DNI, C.NomApels, COUNT(A.Proyecto) AS NumeroProyectos 
FROM CIENTIFICOS C 
LEFT JOIN ASIGNADO_A A ON C.DNI = A.Cientifico 
GROUP BY C.DNI, C.NomApels;

-- 3. Obtener el número de científicos asignados a cada proyecto 
SELECT P.Id, P.Nombre, COUNT(A.Cientifico) AS NumeroCientificos 
FROM PROYECTO P 
LEFT JOIN ASIGNADO_A A ON P.Id = A.Proyecto 
GROUP BY P.Id, P.Nombre;

-- 4. Obtener el número de horas de dedicación de cada científico.
SELECT Cientifico, SUM(Horas) AS TotalHoras 
FROM ASIGNADO_A 
GROUP BY Cientifico;

-- 5. Obtener el DNI y nombre de los científicos que se dedican a más de un proyecto y a cuya dedicación media a cada proyecto sea superior a las 80 horas.
SELECT C.DNI, C.NomApels 
FROM CIENTIFICOS C 
INNER JOIN ASIGNADO_A A ON C.DNI = A.Cientifico 
GROUP BY C.DNI, C.NomApels 
HAVING COUNT(A.Proyecto) > 1 AND AVG(A.Horas) > 80;
