<%@page import="paw.model.Almacen"%>
<%@page import="java.util.List"%>
<%@page import="paw.bd.GestorBD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" lang="es-ES">
    <title>Donde estamos</title>
    <meta name="description" content="Aplicación de prueba de Programación de aplicaciones Web; Grado en informática; Universidad de La Rioja." lang="es-ES">
    <meta name="keywords" content="electrodomesticos" lang="es-ES">
    <meta name="language" content="es-ES">
    <meta name="robots" content="index,follow">

    <link href="css/electrosa.css" rel="stylesheet" media="all" type="text/css">
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.6.0/dist/leaflet.css" />
    <script src="https://unpkg.com/leaflet@1.6.0/dist/leaflet.js"></script>
</head>
  

    <body>
        <%@include file="cabecera.html" %>
        <%
            GestorBD bd = new GestorBD();
            List<Almacen> almacenes = bd.getAlmacenes();
            Almacen centro = bd.getAlmacenDeCP("28001");%>
        <div class="sombra">
            <div class="nucleo">
                <div id="migas">
                    <a href="index.jsp" title="Inicio" >Inicio</a><!-- &nbsp; | &nbsp; 
                    <a href="..." title="Otra cosa">Otra cosa</a>   -->	
                </div>
                <div class="contenido">
                    <h1>Donde estamos</h1>
                    <div class="centro">
                        <h2>Oficinas centrales </h2>
                        <p><strong>Electrosa S.L. </strong><br>
                            C/ Luis de Ulloa, s.n. 
                            26004 - Logro&ntilde;o <br>
                            La Rioja - Spain <br><br>
                            Tfno: (+34) 941 000 000 - FAX:  (+34) 941 000 001</p>
                        <h2>Almacenes de zona </h2>
                        <p>Para  facilitar la gesti&oacute;n ELECTROSA considera la superficie nacional dividida en  cinco zonas: centro, norte, sur, este y oeste. En cada zona dispone de un  almac&eacute;n (almac&eacute;n de referencia de la zona). Puede visitarlos en las siguientes direcciones:</p>
                        <%for (Almacen aux : almacenes) {%>
                        <div class="dirAlmacen"><strong><%=aux.getZona()%> </strong><br>
                            <%=aux.getDireccion().getCalle()%> <br>
                            <%=aux.getDireccion().getCp()%> - <%=aux.getDireccion().getCiudad()%> <br>
                            <%=aux.getDireccion().getProvincia()%> - Spain <br>

                        </div>
                        <%}%>

                        <script>
                            var map;

                            function inicializa() {


                                var cnf = {
                                    center: [<%=centro.getCoordX()%>, <%=centro.getCoordY()%>],
                                    zoom: 6
                                }

                                map = L.map('mapId', cnf)

                                L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                                    attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://cloudmade.com">CloudMade</a>'
                                }).addTo(map);

                                // Añade un marcador al mapa 
                                L.marker([42.4666700, -2.4238500]).bindPopup("Universidad de La Rioja - CCT").addTo(map);
                            <%for (int i = 0; i < almacenes.size(); i++) {%>
                                L.marker([<%=almacenes.get(i).getCoordX()%>,<%=almacenes.get(i).getCoordY()%>]).bindPopup("<%=almacenes.get(i).getZona()%>, <%=almacenes.get(i).getDireccion().toString()%>").addTo(map);
                            <%}%>
                                        

                                    }

                                    window.addEventListener("load", inicializa);

                        </script>
                        
                        <div class="clear"></div>
                        <div id="mapId" style="margin: auto; width: 512px; height: 512px; position: relative; overflow: hidden;"></div>
                    </div>
                </div>
            </div>

            <div class="separa"></div>
            <%@include file="pie.html" %>
    </body>

</html>