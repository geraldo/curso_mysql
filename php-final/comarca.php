 <!DOCTYPE html>
<html>
<head>
    <title>Comarca</title>
</head>
<body>
    <p>[<a href="index.php">Cataluña</a>]</p>

    <?php 
        include_once 'database.php';
        $database = new Database();
        $db = $database->getConnection();

        if (!isset($_GET['codicomar']) || empty($_GET['codicomar']) || !is_numeric($_GET['codicomar'])) {
            echo "Tienes que añadir un parátmetro con un 'codicomar' válido para ver los datos de la comarca.";
            exit();
        }

        $sqlQuery = 'SELECT distinct(nomcomar) FROM municipis WHERE codicomar=' . $_GET['codicomar'];
        $result = $database->queryOne($sqlQuery);
        if (!$result) {
            echo "No existe ninguna comarca con el 'codicomar'=" . $_GET['codicomar'];
            exit();
        }

        $nomcomar = $result['nomcomar'];
    ?>

    <h1>Comarca <?php echo $nomcomar; ?></h1>

    <?php
        echo $nomcomar;
        echo " tiene ";
        $sqlQuery = 'SELECT count(distinct(nommuni)) AS num FROM municipis WHERE codicomar=' . $_GET['codicomar'];
        $result = $database->queryOne($sqlQuery);
        echo $result['num'];
        echo " municipios:";

        $sqlQuery = 'SELECT distinct(nommuni), codimuni FROM municipis WHERE codicomar=' . $_GET['codicomar'];
        $result = $database->queryAll($sqlQuery);
        echo "<ul>";
        foreach ($result as $row) {
          echo "<li><a href='municipio.php?codimuni=" . $row['codimuni'] . "'>" . $row['nommuni'] . "</a></li>";
        }
        echo "</ul>";
    ?>
</body>
</html>