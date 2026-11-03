 <!DOCTYPE html>
<html>
<head>
    <title>Provincia</title>
</head>
<body>
    <p>[<a href="index.php">Cataluña</a>]</p>

    <?php 
        include_once 'database.php';
        $database = new Database();
        $db = $database->getConnection();

        if (!isset($_GET['codiprov']) || empty($_GET['codiprov']) || !is_numeric($_GET['codiprov'])) {
            echo "Tienes que añadir un parátmetro con un 'codiprov' válido para ver los datos de la provincia.";
            exit();
        }

        $sqlQuery = 'SELECT distinct(nomprov) FROM municipis WHERE codiprov=' . $_GET['codiprov'];
        $result = $database->queryOne($sqlQuery);
        if (!$result) {
            echo "No existe ninguna provincia con el 'codiprov'=" . $_GET['codiprov'];
            exit();
        }

        $nomprov = $result['nomprov'];
    ?>

    <h1>Provincia <?php echo $nomprov; ?></h1>

    <?php
        echo $nomprov;
        echo " tiene ";
        $sqlQuery = 'SELECT count(distinct(nomcomar)) AS num FROM municipis WHERE codiprov=' . $_GET['codiprov'];
        $result = $database->queryOne($sqlQuery);
        echo $result['num'];
        echo " comarcas:";

        $sqlQuery = 'SELECT distinct(nomcomar), codicomar FROM municipis WHERE codiprov=' . $_GET['codiprov'];
        $result = $database->queryAll($sqlQuery);
        echo "<ul>";
        foreach ($result as $row) {
          echo "<li><a href='comarca.php?codicomar=" . $row['codicomar'] . "'>" . $row['nomcomar'] . "</a></li>";
        }
        echo "</ul>";
    ?>
</body>
</html>