<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GoogleMap.aspx.cs" Inherits="View_GoogleMap" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <style type="text/css">
        #gmap_canvas img
        {
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
                center: new google.maps.LatLng(10.706929, 107.84324),
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };
            map = new google.maps.Map(document.getElementById("gmap_canvas"), myOptions);
            marker = new google.maps.Marker({
                map: map,
                position: new google.maps.LatLng(10.706929, 107.84324)
            });
            infowindow = new google.maps.InfoWindow({
                content: "<b>Sao Nam - Giải pháp an ninh toàn diện</b><br/>"
            + "<img src='/Design/saonam.jpg' width='300px' height='100px'/>	<br/>"
            + "309A TP Phan Thiết - Bình Thuận - Fax: 0623 82 56 68 <br>Điện thoại: 0623 82 56 68  Email: info@saonaco.com.vn"
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
