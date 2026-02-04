 <!DOCTYPE html>
<html>
<head>
    <title>CCAA Cataluña</title>
</head>
<body>
    <h1>CCAA Cataluña</h1>

    <?php 
        include_once 'database.php';
        $database = new Database();
        $db = $database->getConnection();

        echo "Cataluña tiene ";
        $sqlQuery = 'SELECT count(distinct(nomprov)) AS num FROM municipis';
        $result = $database->queryOne($sqlQuery);
        echo $result['num'];
        echo " provincias:";

        $sqlQuery = 'SELECT distinct(nomprov), codiprov FROM municipis';
        $result = $database->queryAll($sqlQuery);
        echo "<ul>";
        foreach ($result as $row) {
          echo "<li><a href='provincia.php?codiprov=" . $row['codiprov'] . "'>" . $row['nomprov'] . "</a></li>";
        }
        echo "</ul>";
    ?>
</body>
</html>