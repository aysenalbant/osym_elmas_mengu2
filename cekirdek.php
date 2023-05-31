<?php
function baglanveritabani()
{
	$baglanti=mysqli_connect("localhost","root","");
	mysqli_select_db($baglanti,"muhasaebe");
	mysqli_query($baglanti,"SET NAMES utf8");
}
function eklemuhasebekayit($miktar,$tarih,$aciklama)
{
	$baglanti=mysqli_connect("localhost","root","");
	mysqli_select_db($baglanti,"muhasebe");
	mysqli_query($baglanti,"SET NAMES utf8");
	$sorgu="INSERT INTO
	                       tbr_gelirgider
					SET    
					       miktar='$miktar',
						   tarih='$tarih',
						   aciklama='$aciklama'";
return mysqli_query($baglanti,$sorgu);
}


function guncellemuhasebekayit($id,$miktar,$tarih,$aciklama)
{
   $baglanti=mysqli_connect("localhost","root","");
   mysqli_select_db($baglanti,"muhasebe");
   mysqli_query($baglanti,"SET NAMES utf8");
   $sorgu="UPDATE tbr_gelirgider SET 
   miktar='$miktar',
   tarih='$tarih',
   aciklama='$aciklama'
   WHERE
   id='$id'";
return mysqli_query($baglanti,$sorgu);
}

function silmuhasebekayit($id)
{
$baglanti=mysqli_connect("localhost","root","");
mysqli_select_db($baglanti,"muhasebe");
mysqli_query($baglanti,"SET NAMES utf8");
$sorgu="DELETE FROM tbr_gelirgider WHERE
id='$id'";
return mysqli_query($baglanti,$sorgu);
}

function getirmuhasebekayitlar()
{
$baglanti=mysqli_connect("localhost","root","");
mysqli_select_db($baglanti,"muhasebe");
mysqli_query($baglanti,"SET NAMES utf8");
$sorgu=("SELECT * FROM tbr_gelirgider");
$sonuc=mysqli_query($baglanti,$sorgu);
$cevap=array();

while($satir=mysqli_fetch_assoc($sonuc)){
	$cevap[]=$satir;
    return $cevap;
}}


function getirmuhasebebakiye()
{
$baglanti=mysqli_connect("localhost","root","");
mysqli_select_db($baglanti,"muhasebe");
mysqli_query($baglanti,"SET NAMES utf8");
$sorgu="SELECT SUM(miktar) FROM tbr_gelirgider";
$sonuc=mysqli_query($baglanti,$sorgu);
if(mysqli_num_rows($sonuc)>0){
	while($row=mysqli_fetch_assoc($sonuc)){
		return array_sum($row);
	}
	
}	}
?>