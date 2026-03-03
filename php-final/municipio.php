 <!DOCTYPE html>
<html>
<head>
    <title>Municipio</title>
</head>
<body>
    <p>[<a href="index.php">Cataluña</a>]</p>

    <?php 
        include_once 'database.php';
        $database = new Database();
        $db = $database->getConnection();

        if (!isset($_GET['codimuni']) || empty($_GET['codimuni']) || !is_numeric($_GET['codimuni'])) {
            echo "Tienes que añadir un parátmetro con un 'codimuni' válido para ver los datos de la municipio.";
            exit();
        }

        $sqlQuery = 'SELECT * FROM municipis WHERE codimuni=' . $_GET['codimuni'];
        $result = $database->queryOne($sqlQuery);
        if (!$result) {
            echo "No existe ninguna municipio con el 'codimuni'=" . $_GET['codimuni'];
            exit();
        }
    ?>

    <h1>Municipio <?php echo $result['nommuni']; ?></h1>

    <p>Área: <?php echo $result['areapol']; ?></p>
    <p>Habitantes: <?php echo $result['habitants']; ?></p>
    <p>Altitud: <?php echo $result['altitud']; ?></p>
</body>
</html>