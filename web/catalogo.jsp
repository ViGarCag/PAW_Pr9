<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" lang="es-ES">
        <title>Electrosa >> cat&aacute;logo</title>
        <meta name="description" content="Aplicación de prueba de Programación de aplicaciones Web; Grado en informática; Universidad de La Rioja." lang="es-ES">
        <meta name="keywords" content="electrodomesticos" lang="es-ES">
        <meta name="language" content="es-ES">
        <meta name="robots" content="index,follow">

        <link href="css/electrosa.css" rel="stylesheet" media="all" type="text/css">
        <link href="css/catalogoMosaico.css" rel="stylesheet" media="all" type="text/css" title="mosaico">       
        <link href="css/catalogoLista.css" rel="alternate stylesheet" media="all" type="text/css" title="lista"> 
        <link href="fontawesome-free-5.15.3-web/css/all.min.css" rel="stylesheet">
        <link href="css/Ejer3.5.css" rel="stylesheet" type="text/css"/>
        
        <script src="scripts/styleswitcherFGI.js" type="text/javascript"></script>
        <script src="scripts/cambio.js" type="text/javascript"></script>
        <script src="scripts/Ejer3.2.js" type="text/javascript"></script>
        <script src="scripts/Ejer3.4.js" type="text/javascript"></script>
        <script src="scripts/Ejer3.5.js" type="text/javascript"></script>
        <script src="scripts/Ejer3.6.js" type="text/javascript"></script>
        <script src="scripts/Ejer3.8.js" type="text/javascript"></script>
        <script src="scripts/Ejer3.11.js" type="text/javascript"></script>
        
        
        
        <script type="text/javascript">
            window.onload = function () {
                var selPvp = '${param.precio}';
                document.getElementById("precio").value = selPvp;
            };
        </script>
        <script>
            codigo=${empty param.codigo};
            nombre= ${ empty param.nombre};
        </script>
    </head>

    <body >

        <%@include file="cabecera.html" %>
        <div class="sombra">
            <div class="nucleo">

                <div id="migas">
                    <a href="index.html" title="Inicio" >Inicio</a>&nbsp; | &nbsp; 
                    <a href="generica.html" title="Hojear catalogo">Hojear catalogo</a>	<!-- &nbsp; | &nbsp; 
                    <a href="..." title="Otra cosa">Otra cosa</a>   -->	
                </div>
                <div class="dcha" style="width:75px" id="carroDrop">
                    <div style="position: absolute">
                        <a href="clientes/Carrito">
                            <img style="z-index: 0; position: absolute" src="img/AddCart2-50.png">
                        </a>
                        <div style="z-index: 10; position: absolute; top: 10px; left:8px; font-weight: bold; fontsize: 15px"> N </div> <!-- Cambiarás un cosa aquí -->
                    </div>
                </div>
                <div class="contenido">
                    <h1>Nuestros productos</h1>
                    <p>Puede buscar los productos que necesite en nuestro cat&aacute;logo. Lo hemos organizado por marcas, tipo de electrodom&eacute;stico y rango de precios. Lo precios indicados en rojo corresponden a ofertas. </p>
                    <div class="filtroCatalogo">
                        <form name="filtroCatalogo" id="filtroCatalogo" action="BuscarArticulos">

                            <label for="tipo">Tipo: </label>
                            <select name="tipo" id="tipo">
                                <option value="-1">- Cualquiera -</option>
                                <c:forEach var="t" items="${tiposArticulos}">
                                    <option value="${t}" ${(t eq tipo ? 'selected' : '')} >${t}</option>
                                </c:forEach>
                            </select>

                            <label for="fabricante">Fabricante: </label>
                            <select name="fabricante" id="fabricante">
                                <option value="-1">- Cualquiera -</option>
                                <c:forEach var="f" items="${fabricantes}">
                                    <option value="${f}" ${(f eq fabricante ? 'selected' : '')} >${f}</option>
                                </c:forEach>
                            </select>

                            <label for="precio">Precio: </label>
                            <select name="precio" id="precio">
                                <option value="-1">- Cualquiera -</option>
                                <!-- 
                                <c:forEach var="p" items="10-50,50-100,100-200,200-500,500-1000,1000">
                                     <option value="${p}" ${(p eq precio ? 'selected' : '')}>${(p eq '1000' ? 'Mas de 1.000':p)} &euro;</option>                        
                                </c:forEach>
                                -->
                            </select>

                            <!-- TRABAJO 
                            <label for="nombre">Nombre:</label>
                            <input type="text" name="nombre" id="nombre" size="10" value="${nombre}"/>

                            <label for="codigo">Codigo:</label>
                            <input type="text" name="codigo" id="codigo" size="10" value="${codigo}"/>
                            FIN PARTE TRABAJO -->
                            
                            <input name="buscar" id="buscar" type="image" title="Buscar" src="img/search25.png" alt="Buscar">
                            <br>
                            <input type="text" name="nombre" id="nombre" value="${param.nombre}" placeHolder="Nombre" style="margin-left:
                                   10px"/>
                            <input type="text" name="codigo" id="codigo" value="${param.codigo}" placeholder="Código" />
                        </form>

                        <div class="modovisual">
                            <a href="BuscarArticulos">Mosaico</a> &nbsp; | &nbsp; <a href="BuscarArticulos">Lista</a>
                        </div>
                        <div class="clear"></div>
                    </div>

                    <c:set var="parametros" value="&tipo=${tipo}&fabricante=${fabricante}&precio=${precio}"></c:set>

                    <c:if test="${pgdr.getNumRegistros()!=null}">
                        <div class="resumResul redondeo">
                            Encontrados ${pgdr.getNumRegistros()} artículos. <c:if test="${pgdr.getNumRegistros()>0}">Mostrando página ${p} de ${pgdr.getNumPaginas()}.</c:if>
                                <span class="paginador"> 
                                <c:if test="${p>1}">
                                    <a href="BuscarArticulos?p=${p-1}${parametros}">Anterior</a>
                                </c:if>              
                                <c:forEach var="ad" items="${pgdr.adyacentes(p)}">
                                    <c:if test="${ad == p}">
                                        <span>${ad}</span>
                                    </c:if>
                                    <c:if test="${ad != p}">
                                        <a href="BuscarArticulos?p=${ad}${parametros}">${ad}</a>
                                    </c:if>
                                </c:forEach>
                                <c:if test="${p < pgdr.numPaginas}">
                                    <a href="BuscarArticulos?p=${p+1}${parametros}">Siguiente</a>
                                </c:if>                                  
                            </span>
                        </div>
                    </c:if>

                    <ul class="resultBusqueda">
                        <c:forEach var="art" items="${articulos}">

                            <li class="item redondeo" draggable="true">
                                <div class="foto">
                                    <a href="FichaArticulo?cart=${art.codigo}"><img src="img/fotosElectr/${art.foto}" alt="${art.codigo}" width="80" longdesc="${art.descripcion}"></a>			  </div>
                                <div class="datos">
                                    <span>${art.nombre}</span>
                                    <div class="precio">
                                        <span class="">${art.pvp} &euro;</span>				</div>
                                    <div class="carro">
                                        <a href="${pageContext.request.contextPath}/clientes/GestionaPedido?accion=Comprar&ca=${art.codigo}"><img src="img/shopcartadd_16x16.png" title="Añadir a mi carro de la compra"></a></div>
                                </div>			  
                                <div class="codigo"><a href="FichaArticulo?cart=${art.codigo}">${art.codigo}</a></div>
                            </li>
                        </c:forEach>
                    </ul>			
                    <div class="clear"></div>

                </div>
            </div>

            <div class="separa"></div>

            <%@include file="pie.html" %>

        </div>
    </body>
</html>
