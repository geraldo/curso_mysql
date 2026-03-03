-- ¿Cuáles son las 5 países más poblados del mundo?

SELECT name_es 
FROM `countries` 
ORDER BY pop_est DESC
LIMIT 5;


-- ¿Cuáles son los 10 países de Europa con menos habitantes?

SELECT name_es 
FROM `countries` 
WHERE continent = "Europe"
ORDER BY pop_est ASC
LIMIT 10;


-- ¿Calcula la suma de habitantes de Europa?

SELECT SUM(POP_EST)
FROM `countries`
WHERE CONTINENT = "Europe";


-- ¿Cuantos países en el mundo tienen más que un billón de habitantes?

SELECT COUNT(*)
FROM `countries`
WHERE POP_EST > 1000000000;


-- ¿Cual es la población media de todos los países del mundo?

SELECT AVG(POP_EST)
FROM `countries`;


-- ¿Cuantos países tiene cada continente?

SELECT continent, SUM(pop_est) AS pop
FROM `countries` 
GROUP BY continent
ORDER BY pop DESC;


-- ¿Cual es la población media de todos los países por continente?

SELECT continent, AVG(pop_est) AS pop
FROM `countries` 
GROUP BY continent
ORDER BY pop DESC;