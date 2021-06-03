<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="paw.model.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" lang="es-ES">
        <title>Electrosa >> Pedidos del cliente</title>
        <meta name="description" content="Aplicación de prueba de Programación de aplicaciones Web; Grado en informática; Universidad de La Rioja." lang="es-ES">
        <meta name="keywords" content="electrodomesticos" lang="es-ES">
        <meta name="language" content="es-ES">
        <meta name="robots" content="index,follow">

        <link href="${pageContext.request.contextPath}/css/electrosa.css" rel="stylesheet" media="all" type="text/css">
        <link href="${pageContext.request.contextPath}/css/clientes.css" rel="stylesheet" media="all" type="text/css">
        <link href="${pageContext.request.contextPath}/css/listado.css" rel="stylesheet" media="all" type="text/css">

        
        <script src="https://code.jquery.com/jquery-3.6.0.js"></script>

        <script>
        (function () {
        if (!("insertaDespues" in Node.prototype)) {
          Node.prototype.insertaDespues = function (nuevoNodo) {
            var f = this.nextSibling? Node.prototype.insertBefore : Node.prototype.appendChild;
            f.call(this.parentNode, nuevoNodo, this.nextSibling)
          }
        }
        })();
        window.addEventListener("load",desplegar);
        function desplegar(){
            var x=document.getElementsByTagName("a");
            for(var i=0;i<x.length;i++){
                if(x[i].className==="desplegar"){
                    x[i].addEventListener("click",pulsado);   
                }
            }
        }
        function pulsado(evt){       
            var x=document.getElementById(this.id);
            if(x.title==="Desplegar detalle pedido"){
                $.ajax("VerPedido", {
                data: {'cp': this.id},
                dataType: 'json',
                cache: false,
                success: mostrarPedido,
                async: true,
                error: function (xhr, status, ex) {
                    alert("Error (" + xhr.status + "):" + status);
                }
            });
                x.innerHTML="[-]";
                x.title="Ocultar detalle pedido";
                //x.className="ocultar"; //esto lo pongo porqe me entra todo el rato en desplegar al darle click y me lo  saca todo el rato
            }
            else if(x.title==="Ocultar detalle pedido"){   
                ocultar(x);
                x.title="Desplegar detalle pedido";
                x.innerHTML="[+]";
                //x.className="desplegar";
            }
            else{
                alert("no coincide el titulo");
            }
            evt.preventDefault();
        }
        function mostrarPedido(pedido){
            var tr=  document.createElement("tr");
            var td=document.createElement("td");
            td.setAttribute("align","center");
            td.setAttribute("colspan","6");
            tr.appendChild(td);
            var hazHTMLPedido = function (pedido) {
    var html = '<table width="95%"> \
      <colgroup> \
        <col width="9%"><col width="53%"><col width="10%"> \
        <col width="10%"><col width="6%"><col width="6%"> \
      </colgroup> \
      <tr style="text-align: left"><td colspan="6">Detalle del pedido ';
    html += pedido.codigo;
    html += '</td></tr>  \
      <tr style="text-align: left"> \
        <td>Cantidad</td><td>Art&iacute;culo</td><td>P.V.P.</td> \
        <td>Su precio</td><td>F. E. des.</td><td>F. E. prev.</td> \
      </tr>'
    
    html = pedido.lineas.reduce(function (html, l, i) {
      html += '      <tr '+(i%2==0?'class="par"':'')+'> \
        <td style="text-align:center">';
      html += l.cantidad;
      html += '</td><td style="text-align: left">';
      html += l.articulo.codigo +' / '+l.articulo.nombre
      html += '</td><td style="text-align: right">'+l.articulo.pvp+' &euro;</td>'
      html += '<td style="text-align: right">'+ l.precioReal +' &euro;</td>'
      html += '<td>' + l.fechaEntregaDeseada.dayOfMonth + '/' + l.fechaEntregaDeseada.month + '/' + l.fechaEntregaDeseada.year + '</td>';
      html += '<td>' + (!l.fechaEntregaPrevista ? 'S.D.*' :
              l.fechaEntregaPrevista.dayOfMonth + '/' + l.fechaEntregaPrevista.month + '/' + l.fechaEntregaPrevista.year) + '</td></tr>';
      return html;
    }, html)
    html += '</table>'
    
    return html;
  }

          td.innerHTML=hazHTMLPedido(pedido);
          var fila=document.getElementById(pedido.codigo).parentNode.parentNode;
          fila.insertaDespues(tr);
        }
        function ocultar(linea){
            var padre=linea.parentNode.parentNode.parentNode; //fila columna y tabla y con la tabla elimino ya el hijo 
            var siguiente=linea.parentNode.parentNode.nextSibling; //next sibling siguiene nodo, fila en este caso
            padre.removeChild(siguiente);
        }
        
    </script> 
    </head>

    <body >
        <%@include file="CabClientesSesion.html" %>

        <div class="sombra">
            <div class="nucleo">
                <div id="migas">
                    <a href="../index.html" title="Inicio" >Inicio</a> &nbsp; | &nbsp; 
                    <a href="AreaCliente" title="Área de cliente">Área de cliente</a>
                </div>

                <div id="cliente">
                    Bienvenido  ${cliente.getNombre()}
                </div>
                <div class="clear"></div>
                <div class="contenido">
                    <h1>Sus pedidos    </h1>
                    <a name="inicio"></a>   
                    <p>Estos son sus pedidos. </p>
                    <p><c:if test="${pedido!=null}">Actualmente, dispone de un   <a href="${pageContext.request.contextPath}/clientes/carrito.jsp" title="pedido realización">pedido en realización</a></c:if></p>
                        <p>&nbsp;<span class="atajo"><a href="#comp">Completados</a> &nbsp; | &nbsp; <a href="#anul">Anulados</a></span></p>
                        <table width="95%">
                            <colgroup>
                                <col width="5%">
                                <col width="5%">
                                <col width="14%">
                                <col width="14%">
                                <col width="51%">
                                <col width="11%">
                            </colgroup>
                            <tr>
                                <td colspan="6">Listado de pedidos pendientes </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>C&oacute;digo </td>
                                <td>Fecha </td>
                                <td>Direcci&oacute;n de entrega </td>
                                <td>Importe </td>
                            </tr>  
                        <c:forEach var="p" items="${pedidosPendientes}" varStatus="i">
                            <tr <c:if test="${i.index%2==0}"> class="par"</c:if>>
                                <td style="text-align: center"><img src="${pageContext.request.contextPath}/img/pdf.gif" title="Descargar en PDF"/></td>
                                <td style="text-align: center"><a href="${pageContext.request.contextPath}/clientes/VerPedido?cp=${p.getCodigo()}"><img src="${pageContext.request.contextPath}/img/cancel.png" title="Cancelar el pedido"/></a></td>
                                <td><a title="Desplegar detalle pedido" class="desplegar" href="#" id="${p.getCodigo()}">[+]</a><a href="${pageContext.request.contextPath}/clientes/VerPedido?cp=${p.getCodigo()}">${p.getCodigo()}</td>
                                <td><fmt:formatDate value="${p.fechaCierre.time}"/>:</td>
                                <td>${p.getDirEntrega()} </td>
                                <td style="text-align: right"><fmt:formatNumber type="currency" value="${p.importe}"/> </td>
                            </tr>
                        </c:forEach>
                    </table>

                    <span class="atajo"><a href="#inicio">Inicio</a></span>

                    <p>&nbsp;</p>          
                    <a name="comp"></a>
                    <table width="95%">
                        <colgroup>
                            <col width="5%">
                            <col width="14%">
                            <col width="14%">
                            <col width="56%">
                            <col width="11%">
                        </colgroup>
                        <tr>
                            <td colspan="5">Listado de pedidos Completados</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>C&oacute;digo </td>
                            <td>Fecha </td>
                            <td>Direcci&oacute;n de entrega </td>
                            <td>Importe </td>
                        </tr>


                        <c:forEach var="p" items="${pedidosCompletados}" varStatus="i">
                            <tr <c:if test="${i.index%2==0}">class="par"</c:if>>
                                <td style="text-align: center"><img src="${pageContext.request.contextPath}/img/pdf.gif" title="Descargar en PDF"/></td>
                                <td><a title="Desplegar detalle pedido" class="desplegar" href="#" id="${p.getCodigo()}">[+]</a><a href="${pageContext.request.contextPath}/clientes/VerPedido?cp=${p.getCodigo()}">${p.getCodigo()}</td>
                                <td><fmt:formatDate value="${p.fechaCierre.time}"/>:</td>
                                <td>${p.getDirEntrega()} </td>
                                <td style="text-align: right"><fmt:formatNumber type="currency" value="${p.importe}"/> </td>
                            </tr>

                        </c:forEach>
                    </table>

                    <span class="atajo"><a href="#inicio">Inicio</a></span>

                    <p>&nbsp;</p>
                    <a name="anul"></a>
                    <table width="55%">
                        <colgroup>
                            <col width="10%">
                            <col width="26%">
                            <col width="32%">
                            <col width="32%">
                        </colgroup>
                        <tr>
                            <td colspan="4">Listado de pedidos anulados </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>C&oacute;digo</td>
                            <td>Fecha cierre</td>
                            <td>Fecha anulación</td>
                        </tr>            
                        <c:forEach var="p" items="${pedidosAnulados}" varStatus="i">
                            <tr <c:if test="${i.index%2==0}">class="par"</c:if>>
                                <td style="text-align: center"><img src="${pageContext.request.contextPath}/img/pdf.gif" title="Descargar en PDF"/></td>
                                <td><a href="${pageContext.request.contextPath}/clientes/VerPedidoAnulado?cp=${p.getCodigo()}">${p.getCodigo()}</td>
                                <td><fmt:formatDate value="${p.fechaCierre.time}"/>:</td>
                                <td><fmt:formatDate value="${p.fechaAnulacion.time}"/>:</td>
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