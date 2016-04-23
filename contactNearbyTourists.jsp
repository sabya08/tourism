<%@include file="Header.jsp" %>
<%@include file="footer.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Travel - Home</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1251">
<link rel="stylesheet" type="text/css" href="style.css" />
</head>

<body>



		<script>
      function initMap() {
		var myLatLng1 = {lat: 41.8781, lng: -87.6298};
		var myLatLng2 = {lat: 41.8783, lng: -87.6288};
		var myLatLng3 = {lat: 41.8785, lng: -87.6270};
		var myLatLng4 = {lat: 41.8787, lng: -87.6240};
        var mapDiv = document.getElementById('map');
        var map = new google.maps.Map(mapDiv, {
          center: {lat: 41.8781, lng: -87.6298},
          zoom: 12
        });
		
		var marker1 = new google.maps.Marker({
			position: myLatLng1,
			map: map,
			title: 'Sabya Sachi'
		});
		var marker2 = new google.maps.Marker({
			position: myLatLng2,
			map: map,
			title: 'Rohit Jadhav'
		});
		var marker3 = new google.maps.Marker({
			position: myLatLng3,
			map: map,
			title: 'Aditya Kale'
		});
		var marker4 = new google.maps.Marker({
			position: myLatLng4,
			map: map,
			title: 'Ashish Deshpande'
		});
      }
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?callback=initMap"
        async defer></script>
	<div id = "wrapper"></div>
	<div id="wrapper2">
	<div id = "left">
         <table>
			<tr>
				<th>NAME</th> 
				<th>CONTACT</th>
			</tr>
			<tr>
				<td>Sabya Sachi</td>
				<td>+1 (123) 456 - 7890</td>
			</tr>
			<tr>
				<td>Rohit Jadhav</td>
				<td>+1 (123) 456 - 7890</td>
			</tr>
			<tr>
				<td>Aditya Kale</td>
				<td>+1 (123) 456 - 7890</td>
			</tr>
			<tr>
				<td>Ashish Deshpande</td>
				<td>+1 (123) 456 - 7890</td>
			</tr>
			<tr>
				<td>Sushil Pangarkar</td>
				<td>+1 (123) 456 - 7890</td>
			</tr>
	</table>
	</div>
	<div id="map"></div> 
	</div>

		</div>
   </body>
</html>
