-- 4. Clientes cuyo primer apellido inicia con A
SELECT *
FROM Cliente
WHERE Apellido1 LIKE 'A%';


-- 5. Cantidad de clientes que viven en Colombia
SELECT COUNT(*) AS cantidad_clientes
FROM Cliente
WHERE Pais_Residencia = 'COLOMBIA';


-- 6. Países y cantidad de clientes
SELECT Pais_Residencia, COUNT(*) AS cantidad_clientes
FROM Cliente
GROUP BY Pais_Residencia;


-- 7. Clientes de Colombia con apellido GUTIERREZ
SELECT *
FROM Cliente
WHERE Pais_Residencia = 'COLOMBIA'
AND (Apellido1 = 'GUTIERREZ' OR Apellido2 = 'GUTIERREZ');

/*
8. Campos que podrían aceptar NULL:
Nombre2 y Apellido2, porque no todas las personas tienen segundo
nombre o segundo apellido.
*/

/*
9. Campos con restricción de contenido:

Considero que T_Documento y Pais_Residencia deberían manejar
valores válidos.

T_Documento debería permitir únicamente los tipos de documento
definidos por el negocio, por ejemplo CC, CE, TI o PASAPORTE.

Pais_Residencia también debería manejar valores controlados para
evitar registrar el mismo país de diferentes formas, por ejemplo
"COLOMBIA", "Colombia" o "col".

Lo ideal sería manejar estos valores mediante tablas catálogo.
*/

/*
10. Restricción para evitar clientes duplicados:

Crearía una restricción UNIQUE sobre T_Documento y N_Documento,
ya que la combinación del tipo y número de documento debería
identificar de forma única a un cliente.

De esta manera, la base de datos impediría registrar dos clientes
con el mismo tipo y número de documento.
*/

ALTER TABLE Cliente
ADD CONSTRAINT UQ_Cliente_Documento
UNIQUE (T_Documento, N_Documento);

-- 11. Países con menos de 10 clientes
SELECT Pais_Residencia, COUNT(*) AS cantidad_clientes
FROM Cliente
GROUP BY Pais_Residencia
HAVING COUNT(*) < 10;
