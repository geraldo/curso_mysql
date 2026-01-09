-- Añadimos una columna nueva a la tabla de municipios nombrada nomprov para guardar el nombre de las provincias

ALTER TABLE municipis
ADD COLUMN nomprov VARCHAR(50) DEFAULT NULL;


-- Añadimos un nuevo curso definiendo los valores de todas las columnas.

INSERT INTO `cursos`
VALUES (NULL, 'Optimizar MySQL', 'Ismael Kale', '2025-09-28');


-- Añadimos un nuevo curso solamente definiendo el nombre y el tutor.

INSERT INTO `cursos` (`titulo`, `tutor`) 
VALUES ('Optimizar MySQL', 'Ismael Kale');


-- Actualizamos la tabla municipis insertando todos los nombres de las provincias a la columna nomprov utilizando los códigos oficiales de https://www.idescat.cat/codis/?id=50&n=11&lang=es

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


-- Crear una vista de todos los municipios de la comarca del Alt Penedès.

CREATE VIEW `[Municipios Alt Penedès]` AS
SELECT * 
FROM `municipis` 
WHERE nomcomar = "Alt Penedès";


-- Crear una vista de todos los municipios de Catalunya en una altura de más de 1000 metros.

CREATE VIEW `[Municipios Altura]` AS
SELECT * 
FROM `municipis` 
WHERE altitud > 1000;