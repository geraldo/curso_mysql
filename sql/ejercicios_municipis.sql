-- 1. ¿Qué id tiene la comarca del Bages?

SELECT DISTINCT(codicomar)
	FROM municipis
	WHERE nomcomar="Bages"
;


-- 2. ¿Cuántos municipios hay en la comarca del Baix Llobregat?

SELECT count(*)
	FROM municipis
	WHERE nomcomar="Baix Llobregat"
;


-- 3. ¿Cuántos municipios tienen más de 1000 metros de altitud y más de 1000 habitantes?

SELECT count(*)
	FROM municipis
	WHERE habitants>1000 AND altitud>1000
;


-- 4. ¿Cuántos municipios tienen más de 200 km2?

SELECT count(*)
	FROM municipis
	WHERE areapol>200000
;


-- 5. ¿Cuáles son los 10 municipios de Cataluña con más habitantes ordenados con el más poblado primero?

SELECT nommuni, habitants
	FROM municipis
	ORDER BY habitants DESC
	LIMIT 10
;


-- 6. ¿Cuáles son las 5 comarcas de Cataluña con más área (en km²) ordenados con la más grande primera?

SELECT nomcomar, sum(areapol)
	FROM municipis
	GROUP BY nomcomar
	ORDER BY sum(areapol) DESC
	LIMIT 5
;


-- 7. ¿Cuántos municipios hay en cada comarca?

SELECT nomcomar, count(*)
	FROM municipis
	GROUP BY nomcomar
;


-- 8. ¿Cuántos habitantes hay en cada provincia de Cataluña?

SELECT codiprov, sum(habitants)
	FROM municipis
	GROUP BY codiprov
;