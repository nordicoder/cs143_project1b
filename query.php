<html>
<body>

<form method="get" action= "<?php echo $_SERVER["PHP_SELF"]?>">
	<b>Enter the expression </b><input type = "text" name = "fname" style="height:60px; width:640px">
	<input type = "submit" value = "CALCULATE" >
</form>
</body>
</html>

<?php 

	if ((isset($_GET['fname']))){
		$query = $_GET["fname"];
		$db = new mysqli('localhost', 'cs143', '', 'CS143'); 

		if($db->connect_errno > 0){
			die('Unable to connect to database [' . $db->connect_error . ']');
			}

		$x = ($result = $db->query($query));

		if (!$x){
			$errmsg = $db->error; 
			$flag=1;
			print "Query failed: $errmsg <br />"; 
			exit(1); 
			}
		$i=0;
		echo "<table border='1'> <tr> ";
		$row_first = $result->fetch_assoc();

		foreach($row_first as $cname1 => $cvalue1){
			echo "<th>".$cname1."</th>";
			}
		echo "</tr>";

		while($row = mysqli_fetch_assoc($result)){
			echo "<tr>";

			foreach($row as $cname => $cvalue){
				echo "<td>";
				print "$cvalue\n </br>";
				}				
			echo "</td>";
			echo "<tr>";
			}
		}

?>
