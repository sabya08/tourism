<%@include file="Header.jsp" %>
<%@include file="footer.jsp" %>
<html>
<head>
<title>Travel - Home</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1251">
<link rel="stylesheet" type="text/css" href="style.css" />
<%--<link rel="stylesheet" type="text/css" href="style3.css" />--%>
</head>

<body>
	  <script>
      function initMap() {
		var myLatLng1 = {lat: 41.8789, lng: -87.6359};
        var mapDiv = document.getElementById('map');
        var map = new google.maps.Map(mapDiv, {
          center: {lat: 41.8781, lng: -87.6298},
          zoom: 12
        });
		
		var marker1 = new google.maps.Marker({
			position: myLatLng1,
			map: map,
			title: 'Willis Tower'
		});
      }
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?callback=initMap"
        async defer></script>

	<div id="wrapper2">
		 <div id="left">
	 	 	<div id = "main">
				 <h1>Willis Tower</h1>
				 <p>The Willis Tower, built and still commonly referred to as Sears Tower, is a 108-story, 1,451-foot (442 m) skyscraper in Chicago, Illinois, United States.[3] At completion in 1973, it surpassed the World Trade Center towers in New York to become the tallest building in the world, a title it held for nearly 25 years. The Willis Tower is the second-tallest building in the United States and the 14th-tallest in the world. More than one million people visit its observation deck each year, making it one of Chicago's most popular tourist destinations. The structure was renamed in 2009 by the Willis Group as part of its lease on a portion of the tower's space.</p>
			</div>
		 	<div id="slider">
					 <figure>
					 		 <img src="images/tourism/image1.jpg" alt="">
							 <img src="images/tourism/image2.jpeg" alt="">
							 <img src="images/tourism/image3.jpg" alt="">
					</figure>
				</div>	
        </div>     
		<div id="map">
		</div>
		<a href="https://www.google.com/maps/place/Willis+Tower/@41.8788804,-87.6381036,17z/data=!3m1!4b1!4m2!3m1!1s0x880e2cbee269fbbb:0x10f6dce5eb88c7d" class="button">Get Direction -></a>
	</div>


	</div>
   </body>
</html>
