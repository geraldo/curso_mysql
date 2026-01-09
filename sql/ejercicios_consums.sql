-- 1. ¿Qué consumo eléctrico tiene el municipio Prat de Llobregat en 2022?

SELECT SUM(consum_kwh)
FROM `consums_electrics`
WHERE municipi="PRAT DE LLOBREGAT, EL" AND anyo = 2022; 


-- 2. ¿Cuál es el municipio de Cataluña que tiene más consumo eléctrico industrial en 2019?

SELECT municipi, consum_kwh
FROM `consums_electrics`
WHERE descripcio_sector="INDUSTRIAL" AND anyo = 2019
ORDER BY consum_kwh DESC;


-- 3. ¿Cuánto consumo eléctrico tiene la industria en la comarca del Baix Llobregat an 2022?

SELECT SUM(consum_kwh)
FROM `consums_electrics`
WHERE comarca="BAIX LLOBREGAT" AND descripcio_sector="INDUSTRIAL" AND anyo = 2022;


-- 4. Agrupa el consumo eléctrico de Cataluña por sectores en 2022.

SELECT descripcio_sector, SUM(consum_kwh)
FROM `consums_electrics`
WHERE anyo = 2022
GROUP BY descripcio_sector
ORDER BY SUM(consum_kwh) DESC;


-- 5. Agrupa el consumo eléctrico de la comarca de Barcelona por municipios en 2022.

SELECT municipi, SUM(consum_kwh)
FROM `consums_electrics`
WHERE provincia="Barcelona" AND anyo = 2022
GROUP BY municipi
ORDER BY SUM(consum_kwh) DESC;


-- 6. Agrupa el consumo eléctrico de la comarca de Barcelona por municipios y sectores en 2022.

SELECT municipi, descripcio_sector, SUM(consum_kwh)
FROM `consums_electrics`
WHERE provincia="Barcelona" AND anyo = 2022
GROUP BY municipi, descripcio_sector
ORDER BY SUM(consum_kwh) DESC;


-- 7. Mostramos un listado de todos los consumos privados por provincia en 2022.

SELECT m.nomprov, SUM(c.consum_kwh)
FROM municipis AS m 
CROSS JOIN consums_electrics AS c
	ON m.nommuni = c.municipi
	WHERE descripcio_sector="USOS DOMESTICS" AND anyo = 2022
GROUP BY m.nomprov
ORDER BY COUNT(*) DESC;


-- 8. Mostramos un listado de todos los consumos privados por municipio y habitante en el 2022.

SELECT m.nommuni, c.consum_kwh/m.habitants as consum
FROM municipis AS m 
CROSS JOIN consums_electrics AS c
	ON m.nommuni = c.municipi
	WHERE descripcio_sector="USOS DOMESTICS" AND anyo = 2022
ORDER BY consum DESC;