-- Mostramos un listado de todos los bachilleratos (BATX) por municipio ordenado por cantidades.

SELECT m.nommuni, `Codi municipi_6`, COUNT(*)
FROM municipis AS m 
INNER JOIN centres_docents AS c
ON m.codimuni = c.`Codi municipi_6`
WHERE BATX="BATX"
GROUP BY c.`Codi municipi_6`
ORDER BY count(*) DESC;

-- Mostramos un listado de todos los institutos (ESO) por provincia.

SELECT m.codiprov, `Codi municipi_6`, COUNT(*)
FROM municipis AS m 
CROSS JOIN centres_docents AS c
ON m.codimuni = c.`Codi municipi_6`
WHERE ESO="ESO"
GROUP BY m.codiprov
ORDER BY count(*) DESC;

-- Listar los nombres de municipios con sus códigos de las tablas municipis y de centres_docents en una sola tabla.

SELECT `Nom municipi`, `Codi municipi_6` as nom FROM centres_docents
UNION
	SELECT nommuni, codimuni FROM municipis
ORDER BY nom;
