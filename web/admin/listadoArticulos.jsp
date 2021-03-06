<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" lang="es-ES">
    <title>Lista de pedidos del cliente</title>
    <meta name="description" content="Aplicación de prueba de Programación de aplicaciones Web; Grado en informática; Universidad de La Rioja." lang="es-ES">
    <meta name="keywords" content="electrodomesticos" lang="es-ES">
    <meta name="language" content="es-ES">
    <meta name="robots" content="index,follow">

    <link href="../css/electrosa.css" rel="stylesheet" media="all" type="text/css">
    <link href="../css/clientes.css" rel="stylesheet" media="all" type="text/css">
    <link href="../css/listado.css" rel="stylesheet" media="all" type="text/css">
    <link href="../css/estilomenu.css" rel="stylesheet" media="all" type="text/css" />
    
    <script src="../scripts/Ejer11_Mejora2.js" type="text/javascript"></script>
  </head>

  <body >
      <%@include file="cabeceraAdmin.html" %>

    <div class="sombra">
      <div class="nucleo">
        <div id="migas">
          <a href="index.html" title="Inicio" >Inicio</a>
        </div>
        <div class="clear"></div>
        <div class="contenido">
          <h1>Listado de art&iacute;culos     </h1>
          <a name="inicio"></a>
          <table width="95%">
            <colgroup>
              <col width="4%"><col width="4%"><col width="11%"><col width="12%">
              <col width="12%"><col width="36%"><col width="10%"><col width="11%">
            </colgroup>
            <tr>
              <td colspan="8">Listado de art&iacute;culos en la BD </td>
            </tr>


              <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>C&oacute;digo</td>
              <td>Fabricante</td>
              <td>Tipo</td>
              <td>Nombre</td>
              <td>Stock</td>
              <td>P.V.P.</td>
            </tr>  
            <sql:query dataSource="jdbc/electrosa" var="res">
              select a.codigo, a.nombre, a.pvp, a.tipo, a.fabricante, a.foto, a.descripcion, sum(cantidad) as stock
              from articulo a left join stock on a.codigo = stock.codigoArticulo
              group by a.codigo, a.nombre, a.pvp, a.tipo, a.fabricante, a.foto, a.descripcion
            </sql:query>
            <%-- Recorrer el resultado, almacenado en "res" --%>
            <c:forEach var="f" items="${res.rows}" varStatus="st">
              <tr ${st.index % 2==0 ? 'class="par aux"':'"aux"'}>
                <td style="text-align: center"><a href="<c:url value="EditaArticulo"><c:param name="idArt" value="${f.codigo}"/></c:url>"><img src="../img/edit.gif" title="Editar"/></a></td>
                  <td style="text-align: center"><img src="../img/cancel.png" title="Descatalogar"/></td>
                  <td><a href="<c:url value="../FichaArticulo"><c:param name="cart" value="${f.codigo}"/></c:url>">${f.codigo}</a></td>
                <td>${f.fabricante}</td> 
                <td>${f.tipo}</td>
                <td>${f.nombre}</td>
                <td>${f.stock!=null?f.stock:0}</td>
                <td style="text-align: right"><fmt:formatNumber type="currency" value="${f.pvp}" /></td>
              </tr>   
            </c:forEach>     
          </table>

          <span class="atajo"><a href="#inicio">Inicio</a></span>          
        </div>
        <div class="clear"></div>
      </div>
      <div class="separa"></div>
      <div class="pie">
        <span class="pie_izda">
          <a href="mailto:francisco.garcia@unirioja.es">Contacto</a> &nbsp; | &nbsp; <a href="../mapa.html">Mapa</a> </span>
        <span class="pie_dcha">
          &copy; 2012 Francisco J. García Izquierdo  </span>
        <div class="clear"></div>  
      </div>
    </div>
  </body>
</html>