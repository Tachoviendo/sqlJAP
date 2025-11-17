1. Obtener los nombres y los precios de los productos de la tienda.
SELECT Nombre, Precio 
FROM ARTICULOS;

--2. Obtener el nombre de los productos cuyo precio sea mayor o igual a $200
SELECT Nombre 
FROM ARTICULOS 
WHERE Precio >= 200;

-- 3. Obtener todos los datos de los artículos cuyo precio esté entre los $60 y los $120 (ambas cantidades incluidas).
SELECT * 
FROM ARTICULOS 
WHERE Precio BETWEEN 60 AND 120;

-- 4. Obtener el nombre y el precio en pesos (es decir, el precio en dólares multiplicado por 35).
SELECT Nombre, Precio * 35 AS PrecioEnPesos 
FROM ARTICULOS;

-- 5. Obtener el precio medio de los artículos cuyo código de fabricante sea 2.
SELECT AVG(Precio) AS PrecioMedio 
FROM ARTICULOS 
WHERE Fabricante = 2;

-- 6. Obtener el número de artículos cuyo precio sea mayor o igual a $180
SELECT COUNT(*) AS Cantidad 
FROM ARTICULOS 
WHERE Precio >= 180;

-- 7. Seleccionar el precio medio de todos los productos.
SELECT AVG(Precio) AS PrecioMedio 
FROM ARTICULOS;

-- 8. Obtener el nombre y precio de los artículos cuyo precio sea mayor o igual a $180 y ordenarlos descendentemente por precio, y luego ascendentemente por nombre.
SELECT Nombre, Precio 
FROM ARTICULOS 
WHERE Precio >= 180 
ORDER BY Precio DESC, Nombre ASC;

-- 9. Obtener un listado completo de artículos, incluyendo por cada artículo los datos del artículo y de su fabricante.
SELECT A.*, F.* 
FROM ARTICULOS A 
INNER JOIN FABRICANTES F ON A.Fabricante = F.Codigo;

-- 10. Obtener un listado de artículos, incluyendo el nombre del artículo, su precio, y el nombre de su fabricante.
SELECT A.Nombre AS NombreArticulo, A.Precio, F.Nombre AS NombreFabricante 
FROM ARTICULOS A 
INNER JOIN FABRICANTES F ON A.Fabricante = F.Codigo;

-- 11. Obtener el precio medio de los productos de cada fabricante, mostrando solo los códigos de fabricante.
SELECT Fabricante, AVG(Precio) AS PrecioMedio 
FROM ARTICULOS 
GROUP BY Fabricante;

-- 12. Obtener el precio medio de los productos de cada fabricante, mostrando el nombre del fabricante.
SELECT F.Nombre AS NombreFabricante, AVG(A.Precio) AS PrecioMedio 
FROM ARTICULOS A 
INNER JOIN FABRICANTES F ON A.Fabricante = F.Codigo 
GROUP BY F.Nombre;

-- 13. Obtener los nombres de los fabricantes que ofrezcan productos cuyo precio medio sea mayor o igual a $150.
SELECT F.Nombre AS NombreFabricante 
FROM ARTICULOS A 
INNER JOIN FABRICANTES F ON A.Fabricante = F.Codigo 
GROUP BY F.Nombre 
HAVING AVG(A.Precio) >= 150;

-- 14. Obtener el nombre y precio del artículo más barato.
SELECT Nombre, Precio 
FROM ARTICULOS 
WHERE Precio = (SELECT MIN(Precio) FROM ARTICULOS);

-- 15. Obtener una lista con el nombre y precio de los artículos más caros de cada proveedor (incluyendo el nombre del proveedor).
SELECT F.Nombre AS NombreFabricante, A.Nombre AS NombreArticulo, A.Precio 
FROM ARTICULOS A 
INNER JOIN FABRICANTES F ON A.Fabricante = F.Codigo 
WHERE A.Precio = (
    SELECT MAX(Precio) 
    FROM ARTICULOS 
    WHERE Fabricante = A.Fabricante
);

-- 16. Añadir un nuevo producto: Altavoces de $70 (del fabricante 2).
INSERT INTO ARTICULOS (Nombre, Precio, Fabricante) 
VALUES ('Altavoces', 70, 2);

-- 17. Cambiar el nombre del producto 8 a 'Impresora Laser'.
UPDATE ARTICULOS 
SET Nombre = 'Impresora Laser' 
WHERE Codigo = 8;

-- 18. Aplicar un descuento del 10% (multiplicar el precio por 0.9) a todos los productos.
UPDATE ARTICULOS 
SET Precio = Precio * 0.9;

-- 19. Aplicar un descuento de $10 a todos los productos cuyo precio sea mayor o igual a $120.
UPDATE ARTICULOS 
SET Precio = Precio - 10 
WHERE Precio >= 120;
