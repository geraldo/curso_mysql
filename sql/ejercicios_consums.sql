-- 1. ¿Qué consum tiene el municipio Prat de Llobregat?

SELECT SUM(consum_kwh)
	FROM `consums_electrics`
	WHERE municipi="PRAT DE LLOBREGAT, EL"
; 

-- 2. ¿Cuál es el municipio de Cataluña que tiene más consumo eléctrico industrial?

SELECT municipi, consum_kwh
FROM `consums_electrics`
WHERE descripcio_sector="INDUSTRIAL"
GROUP BY municipi
ORDER BY consum_kwh DESC;

-- 3. ¿Cuánto consumo eléctrico tiene la industria en la comarca del Baix Llobregat?

SELECT SUM(consum_kwh)
	FROM `consums_electrics`
	WHERE comarca="BAIX LLOBREGAT" AND descripcio_sector="INDUSTRIAL"
;

-- 4. Agrupa el consumo eléctrico de Cataluña por sectores.

SELECT descripcio_sector, SUM(consum_kwh)
	FROM `consums_electrics`
	GROUP BY descripcio_sector
	ORDER BY SUM(consum_kwh) DESC
;

-- 5. Agrupa el consumo eléctrico de la comarca de Barcelona por municipios.

SELECT municipi, SUM(consum_kwh)
	FROM `consums_electrics`
	WHERE provincia="Barcelona"
	GROUP BY municipi
	ORDER BY SUM(consum_kwh) DESC
;

-- 6. Agrupa el consumo eléctrico de la comarca de Barcelona por municipios y sectores.

SELECT municipi, descripcio_sector, SUM(consum_kwh)
	FROM `consums_electrics`
	WHERE provincia="Barcelona"
	GROUP BY municipi, descripcio_sector
	ORDER BY SUM(consum_kwh) DESC
;

-- 7. Mostramos un listado de todos los consumos privados por provincia.

SELECT m.codiprov, SUM(consum_kwh)
	FROM municipis AS m 
	CROSS JOIN consums_electrics AS c
		ON m.nommuni = c.municipi
		WHERE descripcio_sector="USOS DOMESTICS"
	GROUP BY m.codiprov
	ORDER BY COUNT(*) DESC
;