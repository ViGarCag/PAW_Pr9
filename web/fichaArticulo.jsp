<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" lang="es-ES">
        <title>${art.nombre}</title>
        <meta name="description" content="${art.descripcion}" lang="es-ES">
        <meta name="keywords" content="${art.fabricante} ${art.tipo}" lang="es-ES">
        <meta name="language" content="es-ES">
        <meta name="robots" content="index,follow">

        <link href="css/electrosa.css" rel="stylesheet" media="all" type="text/css">
        <link href="css/fichaProducto.css" rel="stylesheet" media="all" type="text/css">
        <link href="css/estilomenu.css" rel="stylesheet" media="all" type="text/css" />
        <script src="https://unpkg.com/axios@0.21.1/dist/axios.min.js"></script>
        <script>
            window.addEventListener("load", imagen);
            function imagen() {
                var x = document.getElementsByTagName("div");
                for (var i = 0; i < x.length; i++) {
                    if (x[i].className === "stockArt") {
                        x[i].addEventListener("click", pideStock);
                    }
                }
            }
            function pideStock() {
                axios('api/GetStockArticulo', {
                    params: {cart: '${art.codigo}'},
                    responseType: 'text'
                })
                        .then(response => {
                            actualizaStock(response.data)
                        })
                        .catch(err => {
                            alert('Error [' + err + ']')
                        })
            }
            function actualizaStock(elStock) {
                let dest = document.getElementById('stock')
                dest.innerHTML = elStock + ' unidades';
            }
        </script>
    </head>

    <body>
        <c:choose>
            <c:when test="${pageContext.request.isUserInRole('administrador')}">
                <%@ include file="/admin/cabeceraAdmin.html" %>
            </c:when>
            <c:otherwise>
                <%@ include file="cabecera.html" %>
            </c:otherwise>
        </c:choose>

        <div class="sombra">
            <div class="nucleo">
                <div id="migas">
                    <a href="index.html" title="Inicio" >Inicio</a>&nbsp; | &nbsp; 
                    <!-- TRABAJO -->
                    <a href="${OjearCatalogo}" title="Ojear catalogo">Ojear catálogo</a>&nbsp; | &nbsp; ${art.codigo}
                    <!-- FIN PARTE TRABAJO -->
                </div>

                <div class="contenido">
                    <h1>Ficha t&eacute;cnica de ${art.codigo}</h1>
                    <div class="fotoDetalle">
                        <img src="img/fotosElectr/${art.foto}" alt="${art.codigo}" longdesc="${art.nombre}">
                    </div>
                    <div class="datosDetalle">
                        <h2>${art.nombre}</h2>
                        <p>${art.descripcion}</p>
                        <div class="precio">
                            <span>Precio: ${art.pvp} &euro;</span>	
                        </div>

                        <div class="stockArt">
                            <img src="img/Almacen30x30.png" title="Ver stock disponible">&nbsp;
                            <span id="stock"><!-- x unidades --></span><br/>
                        </div>

                        <c:if test="${!pageContext.request.isUserInRole('administrador')}">
                            <div class="carroDetalle" >
                                <a href="${pageContext.request.contextPath}/clientes/GestionaPedido?accion=Comprar&ca=${art.codigo}"><img src="img/AddCart2-50.png" title="Añadir a mi pedido en realización">
                                    </div>
                                </c:if>
                                </div>
                                <div class="clear"></div>
                        </div>
                    </div>

                    <div class="separa"></div>

                    <%@include file="pie.html" %>

                </div>
                </body>
                </html>