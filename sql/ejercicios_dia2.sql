-- ¿Calcula la suma de habitantes de Europa?

SELECT SUM(POP_EST)
FROM `countries`
WHERE CONTINENT = "Europe"


-- ¿Cuantos países en el mundo tienen más que un billón de habitantes?

SELECT COUNT(*)
FROM `countries`
WHERE POP_EST > 1000000000;


-- ¿Cual es la población media de todos los países del mundo?

SELECT AVG(POP_EST)
FROM `countries`;


-- Añadimos una columna nueva a la tabla de municipios nombrada nomprov para guardar el nombre de las provincias

ALTER TABLE municipis
ADD COLUMN nomprov VARCHAR(50) DEFAULT NULL;


-- Actualizamos la tabla municipis insertando todos los nombres de las provincias a la columna nomprov
-- utilizando los códigos oficiales de https://www.idescat.cat/codis/?id=50&n=11&lang=es

UPDATE municipis
SET nomprov = "Barcelona"
WHERE codiprov = 8;

UPDATE municipis SET nomprov = 
CASE
	WHEN codiprov = 8 THEN "Barcelona" 
    WHEN codiprov = 17 THEN "Girona" 
    WHEN codiprov = 25 THEN "Lleida" 
    WHEN codiprov = 43 THEN "Tarragona" 
END;

-- Ejemplo de subquery
-- Título del curso con más participantes

SELECT titulo
FROM `cursos`
WHERE curso_id = (
    SELECT curso_id
	FROM `participantes`
	GROUP BY curso_id
	ORDER BY COUNT(*) DESC
	LIMIT 1
);

-- Ejemplo de join
-- Listado de cursos ordenado por cantidad de participantes

SELECT cursos.titulo, COUNT(*) AS participantes
FROM participantes
INNER JOIN cursos
ON cursos.curso_id = participantes.curso_id
GROUP BY participantes.curso_id
ORDER BY participantes DESC;
