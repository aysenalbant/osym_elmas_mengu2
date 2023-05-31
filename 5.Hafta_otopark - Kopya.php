

<html>
	<head>
		<meta charset="utf-8">
		<title>Otopark</title>
		
	</head>
	<body>
<?php
if (isset($_POST["gonder"])){
	$saat=$_POST["saat"];
	$aracTuru=$_POST["arac"];
	$ucret=0;
	
	if($saat==1 && $aracTuru=="personel"):
	$ucret=1;
	elseif($saat==1 && $aracTuru=="hasta"):
	$ucret=2;
	elseif($saat>1 && $aracTuru=="personel"):
	$ucret=1 +($saat-1)*1.05;
	elseif($saat>1 && $aracTuru=="hasta"):
	$ucret=2 +($saat-1)*1.07*2;
	endif;
	echo "<br><br><br>Kaldığı Süre : $saat <br>". "Araç Türü: $aracTuru <br>". "Ücreti : $ucret<br><br><br>";
}
?>
	
	
	
	
	<form action="" method="post">
		Saat:
			<input type="text" name="saat"><br/>
			Tür:
				<SELECT NAME="arac">
					<OPTION SELECTED>hasta
					<OPTION> personel
					</SELECTED> <br/>
				<input type="submit" name="gonder" value="Hesapla">
	</form>
	</body>
</html>					