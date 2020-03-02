-- 1.1.3 Consultas sobre una tabla

-- 1. Lista el nombre de todos los productos que hay en la tabla producto.
SELECT nombre FROM producto;

-- 2. Lista los nombres y los precios de todos los productos de la tabla producto.
SELECT nombre, precio FROM producto;

-- 3. Lista todas las columnas de la tabla producto.
SELECT * FROM producto;

-- 4. ista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).
SELECT nombre, precio, precio*1.08 FROM producto;

-- 5. Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD). Utiliza los siguientes alias para las columnas: nombre de producto, euros, dólares.
SELECT 	nombre AS 'nombre de producto',
		precio AS 'euros',
        precio*1.08 AS 'dólares'
        FROM producto;
        
-- 6. Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a mayúscula.
SELECT UPPER(nombre) AS 'nombre (mayús.)', precio FROM producto;

-- 7. Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a minúscula.
SELECT LOWER(nombre) AS 'nombre (minús.)', precio FROM producto;

-- 8. Lista el nombre de todos los fabricantes en una columna, y en otra columna obtenga en mayúsculas los dos primeros caracteres del nombre del fabricante.
SELECT nombre, LEFT(nombre, 2) FROM fabricante;

-- 9. Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor del precio.
SELECT nombre, ROUND(precio, 2) FROM producto;

-- 10. Lista los nombres y los precios de todos los productos de la tabla producto, truncando el valor del precio para mostrarlo sin ninguna cifra decimal.
SELECT nombre, TRUNCATE(precio, 0) FROM producto;

-- 11. Lista el código de los fabricantes que tienen productos en la tabla producto
SELECT codigo_fabricante FROM producto;

-- 12. Lista el código de los fabricantes que tienen productos en la tabla producto, eliminando los códigos que aparecen repetidos.
SELECT DISTINCT codigo_fabricante FROM producto;

-- 13. Lista los nombres de los fabricantes ordenados de forma ascendente.
SELECT nombre FROM fabricante ORDER BY nombre ASC;

-- 14. Lista los nombres de los fabricantes ordenados de forma descendente.
SELECT nombre FROM fabricante ORDER BY nombre DESC;

-- 15. Lista los nombres de los productos ordenados en primer lugar por el nombre de forma ascendente y en segundo lugar por el precio de forma descendente.
SELECT nombre, precio FROM producto ORDER BY nombre ASC, precio DESC;

-- 16. Devuelve una lista con las 5 primeras filas de la tabla fabricante.
SELECT nombre FROM fabricante LIMIT 5;

-- 17. Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla fabricante. La cuarta fila también se debe incluir en la respuesta.
SELECT * FROM fabricante WHERE codigo > 3 LIMIT 2;

-- 18. Lista el nombre y el precio del producto más barato. (Utilice solamente las cláusulas ORDER BY y LIMIT)
SELECT nombre, precio FROM producto  ORDER BY precio ASC LIMIT 1;

-- 19. Lista el nombre y el precio del producto más caro. (Utilice solamente las cláusulas ORDER BY y LIMIT)
SELECT nombre, precio FROM producto  ORDER BY precio DESC LIMIT 1;

-- 20. Lista el nombre de todos los productos del fabricante cuyo código de fabricante es igual a 2.
SELECT nombre FROM producto WHERE codigo_fabricante = 2;

-- 21. Lista el nombre de los productos que tienen un precio menor o igual a 120€.
SELECT nombre FROM producto WHERE precio <= 120;

-- 22. Lista el nombre de los productos que tienen un precio mayor o igual a 400€.
SELECT nombre FROM producto WHERE precio >= 400;

-- 23. Lista el nombre de los productos que no tienen un precio mayor o igual a 400€.
SELECT nombre FROM producto WHERE NOT precio >= 400;

-- 24. Lista todos los productos que tengan un precio entre 80€ y 300€. Sin utilizar el operador BETWEEN.
SELECT * FROM producto WHERE precio > 80 AND precio < 300;

-- 25. Lista todos los productos que tengan un precio entre 60€ y 200€. Utilizando el operador BETWEEN.
SELECT * FROM producto WHERE precio BETWEEN 60 AND 200;

-- 26. Lista todos los productos que tengan un precio mayor que 200€ y que el código de fabricante sea igual a 6.
SELECT * FROM producto WHERE precio > 200 AND codigo_fabricante = 6;

-- 27. Lista todos los productos donde el código de fabricante sea 1, 3 o 5. Sin utilizar el operador IN.
SELECT * FROM producto WHERE codigo_fabricante = 1 OR codigo_fabricante = 3 OR codigo_fabricante = 5;

-- 28. Lista todos los productos donde el código de fabricante sea 1, 3 o 5. Utilizando el operador IN.
SELECT * FROM producto WHERE codigo_fabricante IN (1,3,5);

-- 29. Lista el nombre y el precio de los productos en céntimos (Habrá que multiplicar por 100 el valor del precio). Cree un alias para la columna que contiene el precio que se llame céntimos.
SELECT nombre, precio*100 AS 'céntimos' FROM producto;

-- 30. Lista los nombres de los fabricantes cuyo nombre empiece por la letra S.
SELECT nombre FROM fabricante WHERE LEFT(nombre, 1) = 'S';

-- 31. Lista los nombres de los fabricantes cuyo nombre termine por la vocal e.
SELECT nombre FROM fabricante WHERE RIGHT(nombre, 1) = 'e';

-- 32. Lista los nombres de los fabricantes cuyo nombre contenga el carácter w.
SELECT nombre FROM fabricante WHERE nombre LIKE '%w%';

-- 33. Lista los nombres de los fabricantes cuyo nombre sea de 4 caracteres.
SELECT nombre FROM fabricante WHERE LENGTH(nombre) = 4;

-- 34. Devuelve una lista con el nombre de todos los productos que contienen la cadena Portátil en el nombre.
SELECT nombre FROM producto WHERE nombre LIKE '%Portátil%';

-- 35. Devuelve una lista con el nombre de todos los productos que contienen la cadena Monitor en el nombre y tienen un precio inferior a 215 €.
SELECT nombre FROM producto WHERE nombre LIKE '%Monitor%' AND precio < 215;

-- 36. Lista el nombre y el precio de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente).
SELECT nombre, precio FROM producto WHERE precio >= 180 ORDER BY precio DESC, nombre ASC;



-- -------------------------------------------------------------------------
-- 1.1.4. Consultas multitabla (Composición interna)
-- Resuelva todas las consultas utilizando la sintaxis de SQL1 y SQL2.

-- 1. Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos.
SELECT prod.nombre, prod.precio, fab.nombre FROM producto prod LEFT JOIN fabricante fab ON prod.codigo_fabricante = fab.codigo;

-- 2. Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos. Ordene el resultado por el nombre del fabricante, por orden alfabético.
SELECT prod.nombre, prod.precio, fab.nombre FROM producto prod LEFT JOIN fabricante fab ON prod.codigo_fabricante = fab.codigo ORDER BY fab.nombre ASC;

-- 3. Devuelve una lista con el código del producto, nombre del producto, código del fabricante y nombre del fabricante, de todos los productos de la base de datos.
SELECT prod.codigo, prod.nombre, prod.precio, fab.codigo, fab.nombre FROM producto prod LEFT JOIN fabricante fab ON prod.codigo_fabricante = fab.codigo;

-- 4. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.
SELECT prod.nombre, prod.precio, fab.nombre FROM producto prod LEFT JOIN fabricante fab ON prod.codigo_fabricante = fab.codigo ORDER BY prod.precio ASC LIMIT 1;

-- 5. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.
SELECT prod.nombre, prod.precio, fab.nombre FROM producto prod LEFT JOIN fabricante fab ON prod.codigo_fabricante = fab.codigo ORDER BY prod.precio DESC LIMIT 1;

-- 6. Devuelve una lista de todos los productos del fabricante Lenovo.
SELECT prod.* FROM producto prod JOIN fabricante fab ON prod.codigo_fabricante = fab.codigo WHERE fab.nombre = 'Lenovo';

-- 7. Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200€.
SELECT prod.* FROM producto prod JOIN fabricante fab ON prod.codigo_fabricante = fab.codigo WHERE fab.nombre = 'Crucial' AND prod.precio > 200;

-- 8. Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packard y Seagate. Sin utilizar el operador IN.
SELECT prod.* FROM producto prod JOIN fabricante fab ON prod.codigo_fabricante = fab.codigo WHERE fab.nombre = 'Asus' OR fab.nombre = 'Hewlett-Packard' OR fab.nombre = 'Seagate';

-- 9. Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Utilizando el operador IN.
SELECT prod.* FROM producto prod JOIN fabricante fab ON prod.codigo_fabricante = fab.codigo WHERE fab.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');

-- 10. Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo nombre termine por la vocal e.
SELECT prod.nombre, prod.precio FROM producto prod JOIN fabricante fab ON prod.codigo_fabricante = fab.codigo WHERE RIGHT(fab.nombre, 1) = 'e';

-- 11. Devuelve un listado con el nombre y el precio de todos los productos cuyo nombre de fabricante contenga el carácter w en su nombre.
SELECT prod.nombre, prod.precio FROM producto prod JOIN fabricante fab ON prod.codigo_fabricante = fab.codigo WHERE fab.nombre LIKE '%w%';

-- 12. Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente)
SELECT prod.nombre, prod.precio, fab.nombre FROM producto prod JOIN fabricante fab ON prod.codigo_fabricante = fab.codigo WHERE prod.precio >=180 ORDER BY prod.precio DESC, prod.nombre ASC;

-- 13. Devuelve un listado con el código y el nombre de fabricante, solamente de aquellos fabricantes que tienen productos asociados en la base de datos.
SELECT DISTINCT fab.codigo, fab.nombre FROM fabricante fab JOIN producto prod ON fab.codigo = prod.codigo_fabricante;

-- -------------------------------------------------------------------------
-- 1.1.5. Consultas multitabla (Composición interna)
-- Resuelva todas las consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN.

-- 1. Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los productos que tiene cada uno de ellos. El listado deberá mostrar también aquellos fabricantes que no tienen productos asociados.
SELECT fab.*, prod.* FROM fabricante fab LEFT JOIN producto prod ON prod.codigo_fabricante = fab.codigo;

-- 2. Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado.
SELECT fab.*, prod.nombre AS 'Producto' FROM fabricante fab LEFT JOIN producto prod ON prod.codigo_fabricante = fab.codigo WHERE prod.codigo_fabricante IS NULL;

-- 3. ¿Pueden existir productos que no estén relacionados con un fabricante? Justifique su respuesta.
-- No, porque el campo "codigo_fabricante" es un ForeignKey NOT NULL. 
-- Pueden existir casos en la práctica donde un ForeignKey tenga que aceptar la condición de NULL si el proceso
-- de una transacción o una orden lo require (temporalmente), y la base de datos se diseñaria adecuadamente. Pero en este caso no es así.

-- -------------------------------------------------------------------------
-- 1.1.6. Consultas resumen
-- 1. Calcula el número total de productos que hay en la tabla productos.
SELECT COUNT(*) FROM producto;

-- 2. Calcula el número total de fabricantes que hay en la tabla fabricante.
SELECT COUNT(*) FROM fabricante;

-- 3. Calcula el número de valores distintos de código de fabricante aparecen en la tabla productos.
SELECT COUNT(DISTINCT codigo_fabricante) FROM producto;

-- 4. Calcula la media del precio de todos los productos.
SELECT AVG(precio) FROM producto;

-- 5. Calcula el precio más barato de todos los productos.
SELECT precio FROM producto ORDER BY precio ASC LIMIT 1;

-- 6. Calcula el precio más caro de todos los productos.
SELECT precio FROM producto ORDER BY precio DESC LIMIT 1;

-- 7. Lista el nombre y el precio del producto más barato.
SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;

-- 8. Lista el nombre y el precio del producto más caro.
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;

-- 9. Calcula la suma de los precios de todos los productos.
SELECT SUM(precio) FROM producto;

-- 10. Calcula el número de productos que tiene el fabricante Asus.
SELECT COUNT(*) FROM producto prod JOIN fabricante fab ON prod.codigo_fabricante = fab.codigo WHERE fab.nombre = 'Asus';

-- 11. Calcula la media del precio de todos los productos del fabricante Asus.
SELECT AVG(prod.precio) FROM producto prod JOIN fabricante fab ON prod.codigo_fabricante = fab.codigo WHERE fab.nombre = 'Asus';

-- 12. Calcula el precio más barato de todos los productos del fabricante Asus.
SELECT prod.precio FROM producto prod JOIN fabricante fab ON prod.codigo_fabricante = fab.codigo WHERE fab.nombre = 'Asus' ORDER BY prod.precio ASC LIMIT 1;

-- 13. Calcula el precio más caro de todos los productos del fabricante Asus.
SELECT prod.precio FROM producto prod JOIN fabricante fab ON prod.codigo_fabricante = fab.codigo WHERE fab.nombre = 'Asus' ORDER BY prod.precio DESC LIMIT 1;

-- 14. Calcula la suma de todos los productos del fabricante Asus.
SELECT SUM(prod.precio) FROM producto prod JOIN fabricante fab ON prod.codigo_fabricante = fab.codigo WHERE fab.nombre = 'Asus';

-- 15. Muestra el precio máximo, precio mínimo, precio medio y el número total de productos que tiene el fabricante Crucial.
SELECT MAX(prod.precio), MIN(prod.precio), AVG(prod.precio), COUNT(*) FROM producto prod JOIN fabricante fab ON prod.codigo_fabricante = fab.codigo WHERE fab.nombre = 'Crucial';

-- 16. Muestra el número total de productos que tiene cada uno de los fabricantes. El listado también debe incluir los fabricantes que no tienen ningún producto. El resultado mostrará dos columnas, una con el nombre del fabricante y otra con el número de productos que tiene. Ordene el resultado descendentemente por el número de productos.
-- SELECT fab.nombre, COUNT(*) FROM producto prod LEFT JOIN fabricante fab ON fab.codigo = prod.codigo_fabricante GROUP BY fab.nombre ORDER BY COUNT(*) DESC;
-- SELECT fab.nombre, SUM(CASE WHEN prod.codigo_fabricante IS NULL THEN 0 ELSE 1 END) FROM producto prod LEFT OUTER JOIN fabricante fab ON fab.codigo = prod.codigo_fabricante OR prod.codigo_fabricante IS NULL GROUP BY fab.nombre ORDER BY COUNT(*) DESC;

-- 17. Muestra el precio máximo, precio mínimo y precio medio de los productos de cada uno de los fabricantes. El resultado mostrará el nombre del fabricante junto con los datos que se solicitan.
SELECT MAX(prod.precio), MIN(prod.precio), AVG(prod.precio), fab.nombre FROM producto prod JOIN fabricante fab ON prod.codigo_fabricante = fab.codigo GROUP BY prod.codigo_fabricante;

-- 18. Muestra el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€. No es necesario mostrar el nombre del fabricante, con el código del fabricante es suficiente.
SELECT MAX(prod.precio), AVG(prod.precio), COUNT(*), prod.codigo_fabricante FROM producto prod JOIN fabricante fab ON prod.codigo_fabricante = fab.codigo GROUP BY prod.codigo_fabricante HAVING AVG(prod.precio) > 200;

-- 19. Muestra el nombre de cada fabricante, junto con el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€. Es necesario mostrar el nombre del fabricante.
SELECT fab.nombre, MAX(prod.precio), MIN(prod.precio), AVG(prod.precio), COUNT(*) FROM producto prod JOIN fabricante fab ON prod.codigo_fabricante = fab.codigo GROUP BY prod.codigo_fabricante HAVING AVG(prod.precio) > 200;

-- 20. Calcula el número de productos que tienen un precio mayor o igual a 180€.
SELECT COUNT(*) FROM producto prod WHERE prod.precio >= 180;

-- 21. Calcula el número de productos que tiene cada fabricante con un precio mayor o igual a 180€.
SELECT COUNT(*), prod.codigo_fabricante FROM producto prod WHERE prod.precio >= 180 GROUP BY prod.codigo_fabricante;

-- 22. Lista el precio medio los productos de cada fabricante, mostrando solamente el código del fabricante.
SELECT AVG(prod.precio), prod.codigo_fabricante FROM producto prod GROUP BY prod.codigo_fabricante;

-- 23. Lista el precio medio los productos de cada fabricante, mostrando solamente el nombre del fabricante.
SELECT AVG(prod.precio), fab.nombre FROM producto prod JOIN fabricante fab ON prod.codigo_fabricante = fab.codigo GROUP BY prod.codigo_fabricante;

-- 24. Lista los nombres de los fabricantes cuyos productos tienen un precio medio mayor o igual a 150€.
SELECT AVG(prod.precio), fab.nombre FROM producto prod JOIN fabricante fab ON prod.codigo_fabricante = fab.codigo GROUP BY prod.codigo_fabricante HAVING AVG(prod.precio) >= 150;

-- 25. Devuelve un listado con los nombres de los fabricantes que tienen 2 o más productos.
SELECT fab.nombre FROM fabricante fab JOIN producto prod ON prod.codigo_fabricante = fab.codigo GROUP BY prod.codigo_fabricante HAVING COUNT(*) >= 2;

-- 26. Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con un precio superior o igual a 220 €. No es necesario mostrar el nombre de los fabricantes que no tienen productos que cumplan la condición.

-- 27. Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con un precio superior o igual a 220 €. El listado debe mostrar el nombre de todos los fabricantes, es decir, si hay algún fabricante que no tiene productos con un precio superior o igual a 220€ deberá aparecer en el listado con un valor igual a 0 en el número de productos.

-- 28. Devuelve un listado con los nombres de los fabricantes donde la suma del precio de todos sus productos es superior a 1000 €.