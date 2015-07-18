<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GoogleMap.aspx.cs" Inherits="View_GoogleMap" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <style type="text/css">
        #gmap_canvas img {
            max-width: none !important;
            background: none !important;
        }
    </style>
</head>
<body>
    <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
    <div style="overflow: hidden; height: 500px; width: 800px;">
        <div id="gmap_canvas" style="height: 500px; width: 800px;">
        </div>

        <a class="google-map-code" href="http://www.sparbalu.com/tests/monitor" id="get-map-data">http://www.sparbalu.com/tests/monitor</a>
    </div>
    <script type="text/javascript">
        function init_map() {
            var myOptions = {
                zoom: 14,
                center: new google.maps.LatLng(10.9226885, 108.1119883),
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };
            map = new google.maps.Map(document.getElementById("gmap_canvas"), myOptions);
            marker = new google.maps.Marker({
                map: map,
                position: new google.maps.LatLng(10.9226885, 108.1119883)
            });
            infowindow = new google.maps.InfoWindow({
                content: "<b>CTY TNHH SX-TM ĐĂNG TÂM</b><br/>"
            + "<img src='/Design/tasty.jpg' width='310px' height='135px'/>	<br/>"
            + "131 Lê Lợi, P.Hưng Long, Phan Thiết - Fax: 0623 823 700 <br>ĐT: 0623 822 715  Email: tastyngotngao168@gmail.com"
            });
            google.maps.event.addListener(marker, "click", function () {
                infowindow.open(map, marker);
            });
            infowindow.open(map, marker);
        }
        google.maps.event.addDomListener(window, 'load', init_map);
    </script>
</body>
</html>
