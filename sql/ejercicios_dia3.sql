-- Listar los nombres de municipios con sus códigos de las tablas municipis y de centres_docents en una sola tabla.

SELECT `Nom municipi`, `Codi municipi_6` as nom FROM centres_docents
UNION
	SELECT nommuni, codimuni FROM municipis
ORDER BY nom;


-- Mostramos un listado de todos los bachilleratos (BATX) por municipio ordenado por cantidades.

SELECT m.nommuni, `Codi municipi_6`, COUNT(*)
FROM municipis AS m 
INNER JOIN centres_docents AS c
ON m.codimuni = c.`Codi municipi_6`
WHERE BATX="BATX"
GROUP BY c.`Codi municipi_6`
ORDER BY count(*) DESC;


SELECT `Nom municipi`, `Denominació completa`, count(*) 
FROM centres_decents 
WHERE BATX=`BATX` 
GROUP BY `Nom municipi` 
ORDER BY count(*) DESC;


-- Mostramos un listado de todos los institutos (ESO) por provincia.

SELECT m.nomprov, COUNT(*)
FROM municipis AS m 
CROSS JOIN centres_docents AS c
ON m.codimuni = c.`Codi municipi_6`
WHERE ESO="ESO"
GROUP BY m.nomprov
ORDER BY count(*) DESC;


-- Actualizar todos los datos de una columna usando su valor original

UPDATE participantes AS p1
SET direccion = (
    CONCAT((SELECT direccion FROM participantes AS p2 WHERE p1.participante_id = p2.participante_id), " (Catalunya)")
);
