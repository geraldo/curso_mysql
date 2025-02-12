-- ¿Cuantos países hay en el mundo?
SELECT count(*) FROM countries;


-- ¿Qué código ISO tiene Georgia?
SELECT iso_a2, iso_a3 FROM countries WHERE name_es = "Georgia"; 


-- ¿Qué población tiene Siria?
SELECT pop_est FROM countries WHERE name_es = "Siria";


-- ¿Qué PIB por persona tiene Alemania?
SELECT gdp_year/pop_est*1000000 FROM countries WHERE name_es = "Alemania";


-- ¿Cuántos países tienen más 100.000.000 de habitantes?
SELECT name_es, pop_est FROM countries WHERE pop_est > 100000000;


-- ¿Cuántos países tienen África?
SELECT count(*) FROM countries WHERE continent = "Africa"; 